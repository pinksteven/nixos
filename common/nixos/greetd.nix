{ pkgs, ... }:
let
  theme = ''border=blue;text=yellow;prompt=green;action=cyan;button=magenta;container=black;input=white'';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --asterisks-char • --window-padding 1 -t --time-format '%H:%M | %a  %d %b %Y' -g 'Welcome back!' -c 'Hyprland > /dev/null 2>&1' --theme '${theme}'";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [ greetd.tuigreet ];

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}

