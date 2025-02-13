{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- syncthing --no-browser"
      "uwsm app -- discord --start-minimized"
      "uwsm app -- steam -silent"
      "uwsm app -s b -- trayscale --hide-window"
    ];
  };
}
