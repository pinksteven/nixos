# Hyprpanel is the bar on top of the screen
# Display information like workspaces, battery, wifi, ...
{
  inputs,
  pkgs,
  ...
}:
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

    settings = {
      scalingPriority = "hyprland";
      wallpaper.enable = false;

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
    };
  };
}
