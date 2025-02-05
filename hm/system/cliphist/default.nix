# Clipman allows you to save and retrieve clipboard history.
{ pkgs, ... }:
let
  clipboard-clear = pkgs.writeShellScriptBin "clipboard-clear" ''
    cliphist wipe
  '';

  clipboard = pkgs.writeShellScriptBin "clipboard" ''
    if pgrep tofi; then
      	pkill tofi
    else
      cliphist list | tofi --padding-left 20% --padding-right 20% | cliphist decode | wl-copy
    fi
  '';

in
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "${clipboard-clear}"
    "wl-paste -t text --watch cliphist store"
    "wl-paste -t image --watch cliphist store"
  ];
  home.packages = with pkgs; [
    cliphist
    clipboard
    clipboard-clear
  ];
}
