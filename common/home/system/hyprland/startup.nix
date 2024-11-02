{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
        "steam -silent"
        "sleep 2; vesktop --start-minimized"
        "easyeffects --gapplication-service"
        "sleep 3; spotify & sleep 2 && hyprctl dispatch focuswindow 'initialtitle:^(Spotify Premium)$' && hyprctl dispatch killactive"
        "syncthing --no-browser"
    ];
  };
}