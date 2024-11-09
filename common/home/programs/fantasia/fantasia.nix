with import <nixpkgs> {};
{ lib, appimageTools, fetchzip }:
let
    pname = "fantasiaarchive";
    version = "0.1.14a";

    src = fetchzip {
        url = "https://github.com/Elvanos/fantasia-archive-v1/releases/download/v${version}/Fantasia.Archive-${version}-linux-appimage.AppImage.zip";
        hash = "sha256-ouSTRv17bfJG/njKvUmBBeNfVX49Vx12+otb0kdNoSA=";
    }+"/Fantasia.Archive-${version}-linux-appimage.AppImage";

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