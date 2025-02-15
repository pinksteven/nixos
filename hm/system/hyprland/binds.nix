{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";
    "$ctrl" = "CONTROL_L";
    bind = [
      "$mod, grave, exec, uwsm app -- ${lib.getExe pkgs.kitty}" # Kitty
      "$shiftMod, grave, exec, uwsm app -- ${lib.getExe pkgs.kitty} --class floatTerm" # Floating Kitty
      "$mod, F, exec, uwsm app -- ${lib.getExe pkgs.kitty} yazi" # File Manager
      "$mod, B, exec, uwsm app -- ${lib.getExe pkgs.firefox}" # Firefox
      "$mod ,XF86AudioPlay, exec, uwsm app -- spotify" # Spotify
      "$ctrl ALT_L, Delete, exec, uwsm app -- ${lib.getExe pkgs.hyprlock}" # Lock
      "$mod, SPACE, exec, uwsm app -- menu" # Launcher
      "$shiftMod, SPACE, exec, uwsm app -- hyprfocus-toggle" # Toggle HyprFocus

      ",PRINT, exec, uwsm app -- screenshot region" # Screenshot region
      "ALT, PRINT, exec, uwsm app -- screenshot window" # Screenshot window
      "$ctrl, PRINT, exec, uwsm app -- screenshot monitor" # Screenshot monitor

      "$mod, PRINT, exec, uwsm app -- screenshot region satty" # Screenshot region then edit
      "$mod ALT, PRINT, exec, uwsm app -- screenshot window satty" # Screenshot window then edit
      "$mod $ctrl, PRINT, exec, uwsm app -- screenshot monitor satty" # Screenshot monitor then edit

      "$mod, V, exec, uwsm app -- clipboard" # Clipboard picker with wofi
    ];

    bindlp = [
      ",XF86AudioMute, exec, uwsm app -- sound-toggle" # Toggle Mute
      ",XF86AudioPlay, exec, uwsm app -- ${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause Song
      ",XF86AudioNext, exec, uwsm app -- ${pkgs.playerctl}/bin/playerctl next" # Next Song
      ",XF86AudioPrev, exec, uwsm app -- ${pkgs.playerctl}/bin/playerctl previous" # Previous Song
      ",switch:Lid Switch, exec, uwsm app -- ${lib.getExe pkgs.hyprlock}" # Lock when closing Lid
    ];

    bindlep = [
      ",XF86AudioRaiseVolume, exec, uwsm app -- sound-up" # Sound Up
      ",XF86AudioLowerVolume, exec, uwsm app -- sound-down" # Sound Down
      ",XF86MonBrightnessUp, exec, uwsm app -- brightness-up" # Brightness Up
      ",XF86MonBrightnessDown, exec, uwsm app -- brightness-down" # Brightness Down
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
