{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur, launcher"
      "animation fade, launcher"

      "noanim, ^bar-.*"
      "blur, ^bar-.*"
      "ignorezero, ^bar-.*"

      "noanim, selection"
      "noanim, hyprpicker"
    ];

    windowrulev2 = [
      "float, tag:modal"
      "pin, tag:modal"
      "center, tag:modal"

      "float, title:^(Save File)$"
      "float, title:^(Open File)$"
      "float, title:^(Sign In - Google Accounts)$"
      "float, class:^()$, title:^(Save File)$"
      "float, class:^()$, title:^(Open File)$"
      "float, class:^()$, title:^(Open Folder)$"

      "float, class:^(.*Overskride.*)$"
      "size 500 700, class:^(.*Overskride.*)$"
      "float, class:^(.*Trayscale.*)$"
      "float, initialTitle:^(Authentication Required)$"
      "float, initialTitle:^(Authorization Failed)$"
      "float, class:^(.*desktop-portal-gtk.*)$"
      "float, class:^(xdg-desktop-portal-kde)$"
      "float, class:^(xdg-desktop-portal-hyprland)$"
      "float, class:^(com.github.Aylur.ags)$"

      # File Manager.
      "float, class:^(yazi)$"
      "size 760 500, class:^(yazi)$"
      "minsize 760 500, class:^(yazi)$"

      # GTK and QT Settings.
      "float, class:^(nwg-look)$"
      "float, class:^(dconf-editor)$"
      "float, class:^(qt5ct)$"
      "float, class:^(qt6ct)$"
      "float, class:^(kvantummanager)$"
      "size 500 700, class:^(dconf-editor)$"
      "size 633 600, class:^(qt5ct)$"
      "size 658 763, class:^(qt6ct)$"
      "size 753 730, class:^(kvantummanager)$"

      # Picture in Picture.
      "float, title:^(Picture in picture)$"
      "float, title:^(Picture-in-Picture)$"
      "size 854 480, title:^(Picture in picture)$"
      "size 854 480, title:^(Picture-in-Picture)$"

      # Kitty terminal.
      "float, class:^(kitty)$"
      "size 820 540, class:^(kitty)$"
      "minsize 800 500, class:^(kitty)$"

      # Browsers.
      "opaque, class:^(firefox)$"

      # Steam.
      "float, class:(steam)"
      "plugin:hyprbars:nobar, class:(steam)"
      "float, class:^()$, title:^(Steam - Self Updater)$"
      "size 400 600, class:^(steam)$, title:^(Friends List)$"
      "move 100%-w-30 100%-w-75, class:^(steam)$, title:^(Friends List)$"
      "tile, class:(steam), title:^(.*Steam.*)$"
      "size 80% 80%, class:^(.*steam_app.*)$"
      "fullscreen, class:^(.*steam_app.*)$"
      "minsize 1 1, title:^()$, class:^(steam)$"

      # Ignore XWayland Video Bridge.
      "opacity 0.0 override 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "nofocus, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"

      # Idle Inhibit.
      "idleinhibit focus, class:.*(steam_app).*"
      "idleinhibit always, class:^(firefox)$, title:^(.*YouTube.*)$"
      "idleinhibit always, class:^(firefox)$, title:^(.*Netflix.*)$"
      "idleinhibit always, class:^(firefox)$, title:^(.*Max.*)$"
      "idleinhibit always, class:^(firefox)$, title:^(.*S[0-9].*E[0-9].*)$"

      # Disable hyprbars
      "plugin:hyprbars:nobar, class:(Fantasia Archive)"

      # Supress windows self maximising
      "suppressevent maximize, class:.*"

    ];
  };
}
