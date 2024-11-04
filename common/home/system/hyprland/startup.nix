{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
        "/etc/profiles/per-user/steven/bin/distrobox-enter  -n GameBox  --   steam -silent"
        "sleep 2; vesktop --start-minimized"
        "easyeffects --gapplication-service"
        "syncthing --no-browser"
    ];
  };
}