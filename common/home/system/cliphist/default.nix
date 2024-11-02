# Clipman allows you to save and retrieve clipboard history.
{ pkgs, ... }:
let
  clipboard-clear = pkgs.writeShellScriptBin "clipboard-clear" ''
    cliphist wipe
  '';

  clipboard = pkgs.writeShellScriptBin "clipboard" ''
    cliphist list | wofi -S dmenu | cliphist decode | wl-copy
  '';

in {
  wayland.windowManager.hyprland.settings.exec-once =
    [ "${clipboard-clear}" "wl-paste -t text --watch cliphist store" "wl-paste -t image --watch cliphist store" ];
  home.packages = with pkgs; [ cliphist clipboard clipboard-clear ];
}