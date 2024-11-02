{ config, inputs, ... }:
let autoGarbageCollector = config.var.autoGarbageCollection;
in {
    nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
    };
    nix.settings = {
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];
    };
    nix.gc = {
        automatic = autoGarbageCollector;
        persistent = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };
}