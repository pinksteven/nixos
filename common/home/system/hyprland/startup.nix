{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "sleep 2; vesktop --start-minimized"
      "easyeffects --gapplication-service"
      "syncthing --no-browser"
      "steam -silent"
      "hyprctl dispatch exec '[workspace special:spotify silent] spotify'; sleep 10; hyprctl dispatch closewindow spotify"
    ];
  };
}
