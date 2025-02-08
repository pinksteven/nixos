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
        	tofi-drun | xargs hyprctl dispatch exec --
        fi
      '';
in
{
  home.packages = [
    menu
  ];
}
