{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (config) var stylix;
  inherit (config.var) theme;

  rgb = color: "rgb(${color})";
  rgba = color: alpha: "rgba(${color}${lib.toHexString (builtins.ceil (alpha * 255))})";
  inherit (config.lib.stylix) colors;
in
{
  imports = [
    ./rules.nix
    ./animations.nix
    ./binds.nix
    ./polkitagent.nix
    ./startup.nix
    ./plugins
    ./env.nix
    ./dwindle.nix # Backup if hy3 breaks or smth
  ];

  home.packages = with pkgs; [
    hyprpicker
    imv
    wf-recorder
    wlr-randr
    wl-clipboard
    brightnessctl
    gnome-themes-extra
    libva
    dconf
    wayland-utils
    wayland-protocols
    glib
    direnv
    meson
    papers
  ];

  stylix.targets.hyprland.enable = false;
  services.hyprpaper.enable = true;
  stylix.targets.hyprpaper.enable = true;

  stylix.iconTheme = {
    enable = true;
    package = pkgs.tela-circle-icon-theme.override { circularFolder = true; };
    dark = "Tela-circle-dark";
    light = "Tela-circle-light";
  };
  stylix.targets.gtk.enable = true;
  stylix.targets.qt.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;

    settings = {
      xwayland.force_zero_scaling = true;
      # exec-once = [ "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" ];

      general = {
        gaps_in = theme.gaps-in;
        gaps_out = theme.gaps-out;
        border_size = theme.border-size;
        "col.active_border" = "${rgb colors.base0C} ${rgb colors.base0D} ${rgb colors.base0E} 45deg";
        "col.inactive_border" = rgb colors.base03;

        resize_on_border = true;
        extend_border_grab_area = 15;
      };

      decoration = {
        active_opacity = stylix.opacity.applications;
        inactive_opacity = stylix.opacity.applications * 0.66;
        rounding = theme.rounding;
        shadow = {
          enabled = true;
          range = 20;
          render_power = 3;
          color = rgba colors.base00 0.8;
        };
        blur = {
          enabled = if theme.blur then "true" else "false";
          size = 12;
          passes = 3;
        };
      };

      group = {
        "col.border_inactive" = rgb colors.base03;
        "col.border_active" = "${rgb colors.base0A} ${rgb colors.base09} ${rgb colors.base08} 45deg";
        "col.border_locked_active" = rgb colors.base08;
        groupbar = {
          text_color = rgb colors.base05;
          "col.active" = rgb colors.base09;
          "col.inactive" = rgb colors.base03;
        };
      };

      misc = {
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background.
        disable_splash_rendering = true;
        disable_autoreload = false;
        new_window_takes_over_fullscreen = 2;
        background_color = rgb colors.base00;
      };

      input = {
        kb_layout = var.keyboardLayout;

        repeat_delay = 300;
        repeat_rate = 50;
        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          disable_while_typing = false;
          natural_scroll = true;
          tap-to-click = true;
          tap-and-drag = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 600;
        workspace_swipe_use_r = true;
      };

      cursor = {
        no_warps = false;
        inactive_timeout = 60;
        enable_hyprcursor = true;
      };
    };
  };
}
