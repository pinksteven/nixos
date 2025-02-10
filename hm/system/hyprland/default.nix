{
  pkgs,
  config,
  inputs,
  ...
}:
let
  border-size = config.var.theme.border-size;
  gaps-in = config.var.theme.gaps-in;
  gaps-out = config.var.theme.gaps-out;
  active-opacity = config.stylix.opacity.applications;
  inactive-opacity = config.stylix.opacity.applications * 0.66;
  rounding = config.var.theme.rounding;
  blur = config.var.theme.blur;
  keyboardLayout = config.var.keyboardLayout;

  rgb = color: "rgb(${color})";
  rgba = color: alpha: "rgba(${color}${alpha})";
  shadow-color = rgba config.lib.stylix.colors.base00 "99";
  border-active = rgb config.lib.stylix.colors.base0D;
  border-inactive = rgb config.lib.stylix.colors.base03;
  border-locked = rgb config.lib.stylix.colors.base0C;
  text-color = rgb config.lib.stylix.colors.base05;
  background = rgb config.lib.stylix.colors.base00;
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
  ];

  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    qadwaitadecorations-qt6
    qadwaitadecorations
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

  # gtk.iconTheme = {
  #   package = pkgs.tela-circle-icon-theme;
  #   name = "Tela-circle-dark";
  # };
  #

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    settings = {
      monitor = ", preferred, auto, 1.566667";
      xwayland = {
        force_zero_scaling = true;
      };
      exec-once = [ "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" ];

      general = {
        gaps_in = gaps-in;
        gaps_out = gaps-out;
        border_size = border-size;
        "col.active_border" = border-active;
        "col.inactive_border" = border-inactive;

        resize_on_border = true;
        extend_border_grab_area = 15;
      };

      decoration = {
        active_opacity = active-opacity;
        inactive_opacity = inactive-opacity;
        rounding = rounding;
        shadow = {
          enabled = true;
          range = 20;
          render_power = 3;
          color = shadow-color;
        };
        blur = {
          enabled = if blur then "true" else "false";
          size = 12;
          passes = 3;
        };
      };

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      master = {
        new_status = "master";
      };

      group = {
        "col.border_inactive" = border-active;
        "col.border_active" = border-inactive;
        "col.border_locked_active" = border-locked;
        groupbar = {
          text_color = text-color;
          "col.active" = border-active;
          "col.inactive" = border-inactive;
        };
      };

      misc = {
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background.
        disable_splash_rendering = true;
        disable_autoreload = true;
        new_window_takes_over_fullscreen = 2;
        background_color = background;
      };

      input = {
        kb_layout = keyboardLayout;

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
