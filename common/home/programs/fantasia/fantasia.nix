{
  lib,
  appimageTools,
  fetchzip,
}:
let
  pname = "fantasiaarchive";
  version = "0.1.15";

  src =
    fetchzip {
      url = "https://github.com/vishiri/fantasia-archive-v1/releases/download/v${version}/Fantasia.Archive-${version}-linux-appImage.zip";
      hash = "sha256-C+5Ed+0wiibW4Cxu+2cyhlccjCCLOqelNg6Afj2/u1Y=";
    }
    + "/Fantasia.Archive-${version}-linux-appimage.AppImage";

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/${pname}.png $out/share/icons/hicolor/512x512/apps/${pname}.png
    substituteInPlace $out/share/applications/${pname}.desktop \
    --replace-fail 'Exec=AppRun' 'Exec=${pname}'
  '';

  meta = {
    description = "A database manager for world building";
    homepage = "https://fantasiaarchive.com/";
    downloadPage = "https://github.com/Elvanos/fantasia-archive-v1/releases";
    license = lib.licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}
