{
  services.wluma = {
    enable = true;
    systemd.enable = true;
    settings = {
      als.iio = {
        path = "/sys/bus/iio/devices";
        thresholds = {
          "0" = "night";
          "20" = "dark";
          "250" = "normal";
          "500" = "bright";
          "80" = "dim";
          "800" = "outdoors";
        };
      };
      output.backlight = [
        {
          name = "eDP-1";
          path = "/sys/class/backlight/amdgpu_bl1";
          capturer = "wayland";
        }
      ];
      keyboard = [
        {
          name = "keyboard-framework";
          path = "/sys/bus/platform/devices/framework_laptop/leds/framework_laptop::kbd_backlight";
        }
      ];
    };
  };
}
