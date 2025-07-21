{ config, pkgs, ... }:

{
  imports = [
    ../../system/nixos/audio.nix
    ../../system/nixos/auto-upgrade.nix
    ../../system/nixos/bluetooth.nix
    ../../system/nixos/docker.nix
    ../../system/nixos/fonts.nix
    ../../system/nixos/fprint.nix
    ../../system/nixos/greetd.nix
    ../../system/nixos/home-manager.nix
    ../../system/nixos/network-manager.nix
    ../../system/nixos/nix.nix
    ../../system/nixos/printing.nix
    ../../system/nixos/secure-boot.nix
    ../../system/nixos/sudo.nix
    ../../system/nixos/systemd-boot.nix
    ../../system/nixos/timezone.nix
    ../../system/nixos/tpm.nix
    ../../system/nixos/users.nix
    ../../system/nixos/utils.nix
    ../../system/nixos/xdg-portal.nix

    ./hardware-configuration.nix
    ./variables.nix
    ./secrets.nix

    ../../themes/pine-rose-glass
  ];

  # some software doesn't work well/at all with home-manager
  programs = {
    # Enable Hyprland managed by UWSM; Configured via home-manager
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    # Steam apparently uses a lot of linking magick that doesn't work with hm
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    gamemode = {
      enable = true;
      settings.custom = {
        start = "hyprctl notify 1 3000 0 'GameMode is now enabled'";
        end = "hyprctl notify 1 3000 0 'GameMode is now disabled'";
      };
    };
  };

  environment.variables = {
    VDPAU_DRIVER = "radeonsi";
  };

  hardware = {
    graphics.enable = true;
    amdgpu = {
      opencl.enable = true;
      amdvlk.enable = true;
    };
  };

  environment.systemPackages = [ pkgs.framework-tool ];

  home-manager.users."${config.var.user}" = import ./home;
  home-manager.sharedModules = [ { stylix.enable = true; } ];

  # Don't touch unless to swap to the one from pregenned cofniguration.nix after install
  system.stateVersion = "24.05";
}
