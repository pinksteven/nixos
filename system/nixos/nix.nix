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
    substituters = [ "https://yazi.cachix.org" ];
    trusted-public-keys = [
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
    ];
  };

  programs.nh = {
    enable = true;
    clean.enable = config.var.autoGarbageCollection;
    clean.extraArgs = "--keep 3 --keep-since 4d";
    flake = config.var.configDirectory;
  };
}
