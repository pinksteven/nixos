# - ## System
#-
#- Useful quick scripts
#-
#- - `menu` - Open tofi with drun mode. (tofi)
{ pkgs, ... }:

let
  menu =
    pkgs.writeShellScriptBin "menu"
      # bash
      ''
        if pgrep tofi; then
        	pkill tofi
        else
        	tofi-drun
        fi
      '';
in
{
  home.packages = [
    menu
  ];
}
