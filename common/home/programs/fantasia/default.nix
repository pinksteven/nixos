{ pkgs, ... }:
{
  home.packages = [(import ./fantasia.nix)]
}