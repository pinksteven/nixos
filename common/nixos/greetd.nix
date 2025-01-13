{ pkgs, ... }:
let
  theme = ''border=blue;text=yellow;prompt=green;action=cyan;button=magenta;container=black;input=white'';
in
{
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  stylix.targets.regreet.enable = true;
  programs.regreet = {
    enable = true;
  };
}
