# - ## System
#-
#- Useful quick scripts
#-
#- - `menu` - Open wofi with drun mode. (tofi)
#- - `lock` - Lock the screen. (hyprlock)
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

  lock =
    pkgs.writeShellScriptBin "lock"
      # bash
      ''
        ${pkgs.hyprlock}/bin/hyprlock
      '';

in
{
  home.packages = [
    menu
    lock
  ];
}
