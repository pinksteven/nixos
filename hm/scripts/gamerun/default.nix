{ pkgs, ... }:
let
  gamerun = pkgs.writeShellScriptBin "gamerun" ''
    ${pkgs.gamemode}/bin/gamemoderun \
    ${pkgs.gamescope}/bin/gamescope -W 2256 -H 1504 -w 1440 -h 960 -r 60 -o 10 -F fsr -b "$@"
  '';
in
{
  home.packages = [
    gamerun
    pkgs.gamescope
    pkgs.gamemode
  ];
}
