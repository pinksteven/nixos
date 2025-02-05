{ config, ... }:
let
  autoGarbageCollector = config.var.autoGarbageCollection;
  configDirectory = config.var.configDirectory;
in
{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  programs.nh = {
    enable = true;
    clean.enable = autoGarbageCollector;
    clean.extraArgs = "--keep 3 --keep-since 4d";
    flake = configDirectory;
  };

  nixpkgs.config.permittedInsecurePackages = [ "electron-27.3.11" ];
}
