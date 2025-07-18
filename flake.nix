{
  description = "NixOS config with home-manager, using hyprland as a window manager and a ton of other shit to create a more complete DE experience. I just like pink as a color don't look to much into the name";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-secrets = {
      url = "git+ssh://git@github.com/pinksteven/nix-secrets?shallow=1&ref=main";
    };

    wallpapers = {
      url = "github:pinksteven/wallpapers";
      flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:KaylorBen/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:pinksteven/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    tinted-theming = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };

    reewal = {
      url = "github:pinksteven/reewal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:pinksteven/caelestia-shell?ref=enabled-option";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    {
      nixosConfigurations = {
        steven-framework = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            flake-self = self;
          };
          modules = [
            {
              _module.args = {
                inherit inputs self;
              };
            }
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd # Change to support correct hardware or remove
            inputs.sops-nix.nixosModules.sops # Handling secrets
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            ./hosts/framework/configuration.nix # Set the host
          ];
        };

        steven-puter = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            flake-self = self;
          };
          modules = [
            {
              _module.args = {
                inherit inputs self;
              };
            }
            inputs.sops-nix.nixosModules.sops # Handling secrets
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            ./hosts/puter/configuration.nix # Set the host
          ];
        };
      };
    };
}
