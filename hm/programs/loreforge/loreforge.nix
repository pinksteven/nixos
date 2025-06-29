{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  alsa-lib,
  nss,
  at-spi2-atk,
  gtk3,
  libgbm,
  systemd,
  libglvnd,
  vulkan-loader,
  autoPatchelfHook,
  wrapGAppsHook,
}:

stdenv.mkDerivation rec {
  pname = "Lore Forge";
  version = "1.2.1";

  src = fetchurl {
    url = "https://storage.googleapis.com/lore-forge-downloads/lore-forge_1.2.1_amd64.deb";
    hash = "sha256-nCDzpmzlWV+srXvIlie+CnVgWhR/iLstOM+1WbPZpd4=";
  };
  unpackCmd = "${dpkg}/bin/dpkg-deb -x $curSrc .";

  nativeBuildInputs = [
    autoPatchelfHook
    wrapGAppsHook
  ];

  buildInputs = [
    gtk3
    alsa-lib
    nss
    libgbm
    at-spi2-atk
  ];

  runtimeDependencies = [
    systemd
  ];

  dontConfigure = true;
  dontBuild = true;
  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -R usr/share $out/
    mkdir -p $out/opt/lore-forge
    cp -R opt/Lore\ Forge/* $out/opt/lore-forge/
    substituteInPlace \
      $out/share/applications/lore-forge.desktop \
      --replace-warn /opt/Lore\ Forge/ ""
    ln -s $out/opt/lore-forge/lore-forge $out/bin/lore-forge
    runHook postInstall
  '';

  postFixup = lib.optionalString stdenv.isLinux ''
    patchelf \
      --add-needed ${libglvnd}/lib/libEGL.so.1 \
      --add-needed ${vulkan-loader}/lib/libvulkan.so.1 \
      $out/opt/lore-forge/lore-forge
  '';

  meta = {
    homepage = "https://loreforge.com/";
    description = "Writing app for writers & worldbuilders.";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
