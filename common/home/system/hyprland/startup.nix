{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
        "steam -silent"
        "vesktop --start-minimized"
        "easyeffects --gapplication-service"
        "spotify & sleep 1 && hyprctl dispatch focuswindow 'initialtitle:^(Spotify Premium)$' && hyprctl dispatch killactive"
    ];
  };
}