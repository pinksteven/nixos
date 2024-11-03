{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
        "/etc/profiles/per-user/steven/bin/distrobox-enter  -n GameBox  --   steam -silent"
        "sleep 2; vesktop --start-minimized"
        "easyeffects --gapplication-service"
        "sleep 4; spotify & sleep 2 && hyprctl dispatch focuswindow 'initialtitle:^(Spotify Premium)$' && hyprctl dispatch killactive"
        "syncthing --no-browser"
    ];
  };
}