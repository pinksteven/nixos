{
  inputs,
  pkgs,
  config,
  ...
}:
let
  rgb = color: "rgb(${color})";
  inherit (config.lib.stylix) colors;
  font = config.stylix.fonts.sansSerif.name;
in
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.hy3.packages.${pkgs.system}.hy3 ];
    settings = {
      general.layout = "hy3";
      plugin.hy3 = {
        enabled = true;
        group_inset = 10;
        tab_first_window = false;

        tabs = {
          height = 4;
          padding = 5;
          from_top = false;
          radius = config.var.theme.rounding;
          border_width = config.var.theme.border-size;
          render_text = false;
          text_font = font;
          text_height = 10;
          text_padding = 3;

          # active tab bar segment colors
          "col.active" = rgb colors.base0D;
          "col.active.border" = rgb colors.base0D;
          "col.active.text" = rgb colors.base05;

          # focused tab bar segment colors (focused node in unfocused container)
          "col.focused" = rgb colors.base0C;
          "col.focused.border" = rgb colors.base0C;
          "col.focused.text" = rgb colors.base05;

          # inactive tab bar segment colors
          "col.inactive" = rgb colors.base03;
          "col.inactive.border" = rgb colors.base03;
          "col.inactive.text" = rgb colors.base05;

          # urgent tab bar segment colors
          "col.urgent" = rgb colors.base0A;
          "col.urgent.border" = rgb colors.base0A;
          "col.urgent.text" = rgb colors.base05;
        };

        autotile = {
          enable = true;
          trigger_width = 800;
          trigger_height = 500;
        };
      };
      bind =
        [
          "ALT, Tab, hy3:togglefocuslayer"
          "$mod, z, hy3:makegroup, tab"
          "$mod, d, hy3:makegroup, h"
          "$mod, s, hy3:makegroup, v"
          "$mod, r, hy3:changegroup, opposite"
          "$mod, a, hy3:changefocus, raise"
          "$shiftMod, a, hy3:changefocus, lower"

          "$mod, Q, killactive," # Close window
          "$shiftMod, Q, hy3:killactive," # Close node

          "$mod, h, hy3:movefocus, l"
          "$mod, j, hy3:movefocus, d"
          "$mod, k, hy3:movefocus, u"
          "$mod, l, hy3:movefocus, r"
          "$mod, left, hy3:movefocus, l"
          "$mod, down, hy3:movefocus, d"
          "$mod, up, hy3:movefocus, u"
          "$mod, right, hy3:movefocus, r"

          "$mod $ctrl, h, hy3:movefocus, l, visible"
          "$mod $ctrl, j, hy3:movefocus, d, visible"
          "$mod $ctrl, k, hy3:movefocus, u, visible"
          "$mod $ctrl, l, hy3:movefocus, r, visible"
          "$mod $ctrl, left, hy3:movefocus, l, visible"
          "$mod $ctrl, down, hy3:movefocus, d, visible"
          "$mod $ctrl, up, hy3:movefocus, u, visible"
          "$mod $ctrl, right, hy3:movefocus, r, visible"

          "$shiftMod, h, hy3:movewindow, l, once"
          "$shiftMod, j, hy3:movewindow, d, once"
          "$shiftMod, k, hy3:movewindow, u, once"
          "$shiftMod, l, hy3:movewindow, r, once"
          "$shiftMod, left, hy3:movewindow, l, once"
          "$shiftMod, down, hy3:movewindow, d, once"
          "$shiftMod, up, hy3:movewindow, u, once"
          "$shiftMod, right, hy3:movewindow, r, once"

          "$shiftMod $ctrl, h, hy3:movewindow, l, once, visible"
          "$shiftMod $ctrl, j, hy3:movewindow, d, once, visible"
          "$shiftMod $ctrl, k, hy3:movewindow, u, once, visible"
          "$shiftMod $ctrl, l, hy3:movewindow, r, once, visible"
          "$shiftMod $ctrl, left, hy3:movewindow, l, once, visible"
          "$shiftMod $ctrl, down, hy3:movewindow, d, once, visible"
          "$shiftMod $ctrl, up, hy3:movewindow, u, once, visible"
          "$shiftMod $ctrl, right, hy3:movewindow, r, once, visible"

          "$mod, F11, fullscreen" # Toggle Fullscreen
          ", F11, fullscreen, 1" # Toggle Maximize
          "$shiftMod, F, togglefloating" # Toggle floating

          "$mod, BRACKETRIGHT, workspace, r+1" # Move to next workspace
          "$mod, BRACKETLEFT, workspace, r-1" # Move to previous workspace
          "$mod SHIFT, BRACKETRIGHT, hy3:movetoworkspace, r+1, follow" # Move with window to next workspace
          "$mod SHIFT, BRACKETLEFT, hy3:movetoworkspace, r-1, follow" # Move with window to previous workspace
          "$mod $ctrl, BRACKETRIGHT, hy3:movetoworkspace, r+1" # Move window to next workspace
          "$mod $ctrl, BRACKETLEFT, hy3:movetoworkspace, r-1" # Move window to previous workspace

          "$mod, i, exec, hyprctl keyword plugin:hy3:tabs:height 20"
          "$mod, i, exec, hyprctl keyword plugin:hy3:tabs:render_text true"
          "$mod, i, exec, hyprctl keyword plugin:hy3:tabs:opacity 0.7"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = if i == 0 then 10 else i;
            in
            [
              "$mod, ${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, ${toString i}, hy3:movetoworkspace, ${toString ws}, follow"
            ]
          ) 9
        ));

      bindn = [
        ", mouse:272, hy3:focustab, mouse"
        ", mouse_down, hy3:focustab, l, require_hovered"
        ", mouse_up, hy3:focustab, r, require_hovered"
      ];

      bindr = [
        "$mod, i, exec, hyprctl keyword plugin:hy3:tabs:height 4"
        "$mod, i, exec, hyprctl keyword plugin:hy3:tabs:render_text false"
        "$mod, i, exec, hyprctl keyword plugin:hy3:tabs:opacity 1.0"
      ];
    };
  };
}
