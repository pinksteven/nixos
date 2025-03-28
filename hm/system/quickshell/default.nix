{ inputs, pkgs, ... }:
let
  quickshell = inputs.quickshell.packages."${pkgs.system}".default;
in
{
  home.packages = [
    quickshell
  ];
  home.sessionVariables = {
    QMLLS_BUILD_DIRS = "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml/:${quickshell}/lib/qt-6/qml/";
  };
}
