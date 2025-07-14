{
  config,
  lib,
  pkgs,
  ...
}:
let
  rgb = color: "rgb(${color})";
  rgba = color: alpha: "rgba(${color}${lib.toHexString (builtins.ceil (alpha * 255))})";
  inherit (config.lib.stylix) colors;
in
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprspace ];
    settings = {
      plugin.overview = {
        # BEHAVIOR
        autoDrag = false;
        autoScroll = true;
        switchOnDrop = true;
        exitOnSwitch = false;
        showEmptyWorkspace = true;

        # LAYOUT
        panelHeight = 250;
        panelBorderWidth = 0;
        workspaceMargin = 10;
        workspaceBorderSize = 0;
        centerAligned = true;
        hideBackgroundLayers = false;
        hideTopLayers = false;
        hideOverlayLayers = true;
        hideRealLayers = true;
        drawActiveWorkspace = true;

        # STYLING
        panelColor = rgba colors.base00 0.1;
        panelBorderColor = rgb colors.base0D;
        workspaceActiveBorder = rgb colors.base05;
        workspaceInactiveBorder = rgb colors.base01;
        dragAlpha = 0.7;
        disableBlur = false;
      };
      bind = [
        "$mod, TAB, overview:toggle" # Overview
      ];
    };
  };
}
