# Hyprpanel is the bar on top of the screen
# Display information like workspaces, battery, wifi, ...
{
  inputs,
  pkgs,
  config,
  ...
}:
let
  font = config.stylix.fonts.serif.name;
  fontSize = "${toString config.stylix.fonts.sizes.desktop}";

  rounding = config.var.theme.rounding;
  border-size = config.var.theme.border-size;

  gaps-out = config.var.theme.gaps-out;

  floating = config.var.theme.bar.floating;
  transparent = config.var.theme.bar.transparent;
  position = config.var.theme.bar.position;
in
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "uwsm app -- ${pkgs.hyprpanel}/bin/hyprpanel"
  ];

  home.packages = with pkgs; [ libnotify ];
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./theme.nix
  ];

  programs.hyprpanel = {
    enable = true;
    overwrite.enable = true;

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [
            "hypridle"
            "hyprsunset"
            "workspaces"
          ];
          middle = [ "media" ];
          right = [
            "systray"
            "network"
            "bluetooth"
            "volume"
            "battery"
            "clock"
            "notifications"
            "power"
          ];
        };
      };
    };

    settings = {
      scalingPriority = "hyprland";

      bar = {
        clock.format = "%a %d %b  %H:%M";
        bluetooth.label = false;
        network = {
          showWifiInfo = true;
          truncation_size = 20;
        };
        notifications.middleClick = "${pkgs.hyprpanel}/bin/hyprpanel clearNotifications";
        volume = {
          scrollDown = "${pkgs.hyprpanel}/bin/hyprpanel vol +2";
          scrollUp = "${pkgs.hyprpanel}/bin/hyprpanel vol -2";
        };
        workspaces = {
          monitorSpecific = false;
          scroll_speed = 1;
        };

        customModules = {
          hypridle = {
            label = false;
            onIcon = "󰾪";
            offIcon = "󰅶";
          };
          hyprsunset = {
            label = false;
            onIcon = "󰖔";
            offIcon = "󰖙";
            temperature = "4000k";
          };
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = false;
          };
          weather.enabled = false;
        };
      };

      theme = {
        bar = {
          transparent = transparent;
          floating = floating;
          location = position;
          outer_spacing = "${if floating && transparent then "0" else "8"}px";
          border_radius = "${toString rounding}px";
          border = {
            location = "full";
            width = "${toString border-size}px";
          };

          margin_top = "${if position == "top" then toString gaps-out else "0"}px";
          margin_bottom = "${if position == "top" then "0" else toString gaps-out}px";
          margin_sides = "${toString gaps-out}px";

          buttons = {
            spacing = "0.3em";
            y_margins = "0";
            padding_x = "0.4em";
            padding_y = "0.2em";
            radius = "${if transparent then toString rounding else toString (rounding - 8)}px";
          };

          menus = {
            border = {
              radius = "${toString rounding}px";
              size = "${toString border-size}px";
            };
            menu.media.card.tint = 50;
            tooltip.radius = "${toString rounding}px";
            card_radius = "${toString rounding}px";
          };
        };
        font = {
          name = font;
          size = fontSize;
        };
        notification = {
          border_radius = "${toString rounding}px";
        };
        osd = {
          enable = true;
          active_monitor = true;
          duration = 2000;
          location = "bottom";
          orientation = "horizontal";
          margins = "0px 0px ${toString (gaps-out * 3)}px 0px";
          muted_zero = false;
          radius = "${toString rounding}px";
        };
      };
      wallpaper.enable = false;
    };
  };
}
