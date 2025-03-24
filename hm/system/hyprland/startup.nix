{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- syncthing --no-browser"
      "uwsm app -- vesktop --start-minimized"
      "uwsm app -- steam -silent"
      "uwsm app -s b -- trayscale --hide-window"
    ];
  };
}
