{
  description = "NixOS config with home-manager, using hyprland as a window manager and a ton of other shit to create a more complete DE experience. I just like pink as a color don't look to much into the name";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    tinted-theming = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
    # Hyprland related stuff
    hyprland.url = "github:hyprwm/Hyprland";
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprpanel.url = "github:Jas-SinghFSU/Hyprpanel";

    blink-cmp.url = "github:Saghen/blink.cmp";
    blink-compat = {
      url = "github:saghen/blink.compat";
      flake = false;
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        steven-framework = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
              _module.args = {
                inherit inputs;
              };
            }
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd # Change to support correct hardware or remove
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            ./hosts/laptop/configuration.nix # Set the host u want to use (currently only laptop)
          ];
        };
      };
    };
}
