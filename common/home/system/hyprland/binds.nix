{ pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {
        "$mod" = "SUPER";
        "$shiftMod" = "SUPER_SHIFT";
        "$ctrl" = "CONTROL_L";
        bindr = [ "$mod, SUPER_L,exec, hyprpanel -t dashboardmenu" ];# Open dashboard with SUPER 
        bind = [
            "$ctrl ALT, T, exec, ${pkgs.kitty}/bin/kitty" # Kitty
            "$mod, F, exec, ${pkgs.kitty}/bin/kitty --class=yazi zsh -c 'yazi; exit'" # File Manager
            "$mod, B, exec, ${pkgs.firefox}/bin/firefox" # Firefox
            "$mod ,XF86AudioPlay, exec, spotify" # Spotify
            "$mod, L, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock
            "$ctrl ALT, Delete, exec, wlogout" # Powermenu
            "$mod, SPACE, exec, menu" # Launcher
            "$shiftMod, SPACE, exec, hyprfocus-toggle" # Toggle HyprFocus
            #"$mod, TAB, overview:toggle" # Overview
            "ALT, Tab, cyclenext" "ALT, Tab, bringactivetotop" # Simulate Alt-Tab behaviour
            "$mod, S, togglesplit," # Change split horizontal/vertical
            "$shiftMod, P, exec, hyprpricker -a"

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

            "$mod SHIFT, right, movetoworkspace, r+1"# Move with window to next workspace
            "$mod SHIFT, left, movetoworkspace, r-1"# Move with window to previous workspace

            "$mod $ctrl, right, movetoworkspacesilent, r+1"# Move window to next workspace
            "$mod $ctrl, left, movetoworkspacesilent, r-1"# Move window to previous workspace


            ",PRINT, exec, screenshot region" # Screenshot region
            "ALT, PRINT, exec, screenshot window" # Screenshot window
            "$ctrl, PRINT, exec, screenshot monitor" # Screenshot monitor

            "$mod, PRINT, exec, screenshot region satty" # Screenshot region then edit
            "$mod ALT, PRINT, exec, screenshot window satty" # Screenshot window then edit
            "$mod $ctrl, PRINT, exec, screenshot monitor satty" # Screenshot monitor then edit

            "$mod, V, exec, clipboard" # Clipboard picker with wofi
            "$shiftMod, E, exec, emojimenu" # Emoji picker with wofi
            "$mod,F2, exec, night-shift" # Toggle night shift
            "$mod,F3, exec, night-shift" # Toggle night shift
        ] ++ (builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
                "$mod,code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
            ]) 9));

        bindl = [
            ",XF86AudioMute, exec, sound-toggle" # Toggle Mute
            ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause Song
            ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next" # Next Song
            ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous" # Previous Song
            ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock when closing Lid
        ];

        bindlep = [
            ",XF86AudioRaiseVolume, exec, sound-up" # Sound Up
            ",XF86AudioLowerVolume, exec, sound-down" # Sound Down
            ",XF86MonBrightnessUp, exec, brightness-up" # Brightness Up
            ",XF86MonBrightnessDown, exec, brightness-down" # Brightness Down
        ];
    };
}

