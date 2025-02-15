{ lib, config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    general.layout = "dwindle";

    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    master = {
      new_status = "master";
    };

    bind =
      [
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop" # Simulate Alt-Tab behaviour
        "$mod, S, togglesplit," # Change split horizontal/vertical

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
  };
}
