{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";
    "$ctrl" = "CONTROL_L";
    bind =
      [
        "$ctrl ALT, T, exec, uwsm app -- ${lib.getExe pkgs.kitty}" # Kitty
        "$mod, F, exec, uwsm app -- ${lib.getExe pkgs.kitty} yazi" # File Manager
        "$mod, B, exec, uwsm app -- ${lib.getExe pkgs.firefox}" # Firefox
        "$mod ,XF86AudioPlay, exec, uwsm app -- spotify" # Spotify
        "$mod, L, exec, uwsm app -- ${lib.getExe pkgs.hyprlock}" # Lock
        "$mod, SPACE, exec, uwsm app -- menu" # Launcher
        "$shiftMod, SPACE, exec, uwsm app -- hyprfocus-toggle" # Toggle HyprFocus

        ", F11, fullscreen" # Toggle Fullscreen

        ",PRINT, exec, uwsm app -- screenshot region" # Screenshot region
        "ALT, PRINT, exec, uwsm app -- screenshot window" # Screenshot window
        "$ctrl, PRINT, exec, uwsm app -- screenshot monitor" # Screenshot monitor

        "$mod, PRINT, exec, uwsm app -- screenshot region satty" # Screenshot region then edit
        "$mod ALT, PRINT, exec, uwsm app -- screenshot window satty" # Screenshot window then edit
        "$mod $ctrl, PRINT, exec, uwsm app -- screenshot monitor satty" # Screenshot monitor then edit

        "$mod, V, exec, uwsm app -- clipboard" # Clipboard picker with wofi
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod,code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      ));

    bindl = [
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
  };
}
