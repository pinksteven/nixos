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
    spicetify-comfy = {
      url = "github:Comfy-Themes/Spicetify";
      flake = false;
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
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };
    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprpanel = {
      url = "github:Jas-SinghFSU/Hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpolkitagent = {
      url = "github:hyprwm/hyprpolkitagent";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Yazi plugins
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
    starship-yazi = {
      url = "github:Rolv-Apneseth/starship.yazi";
      flake = false;
    };
    eza-preview = {
      # use an up to date fork
      url = "github:pinksteven/eza-preview.yazi";
      flake = false;
    };
    lazygit-yazi = {
      url = "github:Lil-Dank/lazygit.yazi";
      flake = false;
    };
    ouch-yazi = {
      url = "github:ndtoan96/ouch.yazi";
      flake = false;
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
              nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
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
      };
    };
}
