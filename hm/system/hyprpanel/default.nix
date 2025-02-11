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
  fontSize = config.stylix.fonts.sizes.desktop;

  rounding = config.var.theme.rounding;
  border-size = config.var.theme.border-size;

  gaps-out = config.var.theme.gaps-out;

  floating = config.var.theme.bar.floating;
  transparent = config.var.theme.bar.transparent;
  opacity = config.stylix.opacity.desktop;
  position = config.var.theme.bar.position;
in
{
  home.packages = with pkgs; [
    libnotify
    hypridle
  ];

  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./theme.nix
  ];

  wayland.windowManager.hyprland.settings.exec-once = [ "uwsm app -s s -- hyprpanel" ];

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
            # waiting for a pr to get merged
            # startCommand = "systemctl --user start hypridle";
            # stopCommand = "systemctl --user stop hypridle";
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
        transitionTime = 300;
        clock = {
          time = {
            military = true;
            hideSeconds = false;
          };
          weather.enabled = false;
        };
        power = {
          logout = "uwsm stop";
        };
      };

      theme = {
        tooltip.scaling = 75;
        bar = {
          inherit transparent floating;
          location = position;
          outer_spacing = "${if floating && transparent then "0" else "8"}px";
          border_radius = "${toString rounding}px";
          opacity = if transparent then 0 else (builtins.floor (opacity * 100));
          dropdownGap = "${toString (gaps-out + (fontSize * 2))}px";
          border = {
            location = "none";
            width = "${toString border-size}px";
          };

          margin_top = "0px";
          margin_bottom = "0px";
          margin_sides = "${toString gaps-out}px";

          buttons = {
            spacing = "0.3em";
            y_margins = "0";
            padding_x = "0.6em";
            padding_y = "0.2em";
            radius = "${toString rounding}px";
          };

          menus = {
            border = {
              radius = "${toString rounding}px";
              size = "${toString border-size}px";
            };
            menu.media.card.tint = 50;
            tooltip.radius = "${toString rounding}px";
            card_radius = "${toString rounding}px";
            popover = {
              radius = "${toString rounding}px";
              scaling = 75;
            };
          };
        };
        font = {
          name = font;
          size = "${toString fontSize}";
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
          border.size = "${toString border-size}px";
        };
      };
      wallpaper.enable = false;
    };
  };
}
