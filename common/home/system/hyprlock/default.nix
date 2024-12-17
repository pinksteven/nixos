# Hyprlock is a lockscreen for Hyprland
{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  foreground = "rgb(${config.lib.stylix.colors.base05})";
  background = "rgba(${config.lib.stylix.colors.base01}88)";
  error_color = "rgb(${config.lib.stylix.colors.base08})";
  check_color = "rgb(${config.lib.stylix.colors.base09})";
  imageStr = toString config.stylix.image;
  font = config.stylix.fonts.serif.name;
in
{
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
    settings = lib.mkForce {
      general = {
        grace = 2;
        no_fade_in = false;
        disable_loading_bar = false;
        enable_fingerprint = true;
        fingerprint_ready_message = "(Scan fingerprint to unlock)";
        fingerprint_present_message = "Scanning fingerprint";
      };

      # BACKGROUND
      background = {
        monitor = "";
        path = imageStr;
        blur_passes = 1;
        contrast = 0.8916;
        brightness = 0.7172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      label = [
        {
          # Day-Month-Date
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = foreground;
          font_size = 28;
          font_family = font + " Bold";
          position = "0, 490";
          halign = "center";
          valign = "center";
        }
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%H:%M")</span>"'';
          color = foreground;
          font_size = 160;
          font_family = "steelfish outline regular";
          position = "0, 370";
          halign = "center";
          valign = "center";
        }
        # USER
        {
          monitor = "";
          text = " $USER";
          color = foreground;
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          font_size = 30;
          font_family = font + " Bold";
          position = "0, -180";
          halign = "center";
          valign = "center";
        }
        # FPRINT
        {
          monitor = "";
          text = "$FPRINTMESSAGE";
          color = foreground;
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          font_size = 16;
          font_family = font;
          position = "0, -320";
          halign = "center";
          valign = "center";
        }
      ];

      # INPUT FIELD
      input-field = [
        {
          monitor = "";
          size = "500, 60";
          outline_thickness = 3;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(255, 255, 255, 0)";
          inner_color = background;
          check_color = check_color;
          fail_color = error_color;
          font_color = foreground;
          fade_on_empty = false;
          font_family = font + " Bold";
          placeholder_text = "<i>🔒 Enter Password</i>";
          hide_input = false;
          position = "0, -250";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
