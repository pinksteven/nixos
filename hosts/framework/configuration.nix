{ config, pkgs, ... }:

{
  imports = [
    ../../nixos/audio.nix
    ../../nixos/auto-upgrade.nix
    ../../nixos/bluetooth.nix
    ../../nixos/docker.nix
    ../../nixos/fonts.nix
    ../../nixos/fprint.nix
    ../../nixos/greetd.nix
    ../../nixos/home-manager.nix
    ../../nixos/network-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/timezone.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/variables-config.nix
    ../../nixos/xdg-portal.nix
    ../../nixos/sudo.nix
    ../../nixos/printing.nix
    ../../nixos/uwsm.nix

    ./hardware-configuration.nix
    ./variables.nix
    ./secrets.nix

    ../../themes/pine-rose-glass
  ];

  # some programs don't work with home manager
  programs = {
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
