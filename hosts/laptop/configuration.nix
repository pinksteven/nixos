{ config, ... }:

{
  imports = [
    ../../common/nixos/audio.nix
    ../../common/nixos/auto-upgrade.nix
    ../../common/nixos/bluetooth.nix
    ../../common/nixos/docker.nix
    ../../common/nixos/fonts.nix
    ../../common/nixos/fprint.nix
    ../../common/nixos/greetd.nix
    ../../common/nixos/home-manager.nix
    ../../common/nixos/network-manager.nix
    ../../common/nixos/nix.nix
    ../../common/nixos/systemd-boot.nix
    ../../common/nixos/timezone.nix
    ../../common/nixos/users.nix
    ../../common/nixos/utils.nix
    ../../common/nixos/variables-config.nix
    ../../common/nixos/xdg-portal.nix
    ../../common/nixos/sudo.nix

    ./hardware-configuration.nix
    ./variables.nix

    ../../themes/stylix/pinixk.nix
  ];

  # steam doesn't work with home manager
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  environment.variables = {
    VDPAU_DRIVER = "radeonsi";
  };

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch unless to swap to the one from pregenned cofniguration.nix after install
  system.stateVersion = "24.05";
}
