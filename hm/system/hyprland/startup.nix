{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- syncthing --no-browser"
      "sleep 3; uwsm app -- discord --start-minimized"
      "uwsm app -- steam -silent"
    ];
  };
}
