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
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop" # Simulate Alt-Tab behaviour
        "$mod, S, togglesplit," # Change split horizontal/vertical
        # "$shiftMod, P, exec,hyprpricker -a"

        "$mod, Q, killactive," # Close window
        ", F11, fullscreen" # Toggle Fullscreen

        "$ctrl, left, movefocus, l" # Move focus left
        "$ctrl, right, movefocus, r" # Move focus Right
        "$ctrl, up, movefocus, u" # Move focus Up
        "$ctrl, down, movefocus, d" # Move focus Down

        "$mod, up, fullscreen, 1" # Toggle Maximize
        "$mod, down, togglefloating" # Toggle floating
        "$mod, right, workspace, r+1" # Move to next workspace
        "$mod, left, workspace, r-1" # Move to previous workspace

        "$mod SHIFT, right, movetoworkspace, r+1" # Move with window to next workspace
        "$mod SHIFT, left, movetoworkspace, r-1" # Move with window to previous workspace

        "$mod $ctrl, right, movetoworkspacesilent, r+1" # Move window to next workspace
        "$mod $ctrl, left, movetoworkspacesilent, r-1" # Move window to previous workspace

        ",PRINT, exec, uwsm app -- screenshot region" # Screenshot region
        "ALT, PRINT, exec, uwsm app -- screenshot window" # Screenshot window
        "$ctrl, PRINT, exec, uwsm app -- screenshot monitor" # Screenshot monitor

        "$mod, PRINT, exec, uwsm app -- screenshot region satty" # Screenshot region then edit
        "$mod ALT, PRINT, exec, uwsm app -- screenshot window satty" # Screenshot window then edit
        "$mod $ctrl, PRINT, exec, uwsm app -- screenshot monitor satty" # Screenshot monitor then edit

        "$mod, V, exec, clipboard" # Clipboard picker with wofi
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
      ",XF86AudioMute, exec, sound-toggle" # Toggle Mute
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause Song
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next" # Next Song
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous" # Previous Song
      ",switch:Lid Switch, exec, uwsm app -- ${lib.getExe pkgs.hyprlock}" # Lock when closing Lid
    ];

    bindlep = [
      ",XF86AudioRaiseVolume, exec, sound-up" # Sound Up
      ",XF86AudioLowerVolume, exec, sound-down" # Sound Down
      ",XF86MonBrightnessUp, exec, brightness-up" # Brightness Up
      ",XF86MonBrightnessDown, exec, brightness-down" # Brightness Down
    ];
  };
}
