{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- caelestia shell"
      "uwsm app -- syncthing --no-browser"
      "sleep 3; uwsm app -- vesktop --start-minimized"
      "uwsm app -- steam -silent"
      "uwsm app -s b -- trayscale --hide-window"
    ];
  };
}
