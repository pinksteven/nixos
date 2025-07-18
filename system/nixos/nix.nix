{ config, ... }:
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
  };

  programs.nh = {
    enable = true;
    clean.enable = config.var.autoGarbageCollection;
    clean.extraArgs = "--keep 3 --keep-since 4d";
    flake = config.var.configDirectory;
  };
}
