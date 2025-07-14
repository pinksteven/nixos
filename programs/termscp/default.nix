{ pkgs, ... }:
{
  imports = [
    ./config.nix
    ./theme.nix
  ];
  home.packages = [ pkgs.termscp ];
}
