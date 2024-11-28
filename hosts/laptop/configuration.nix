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

    ../../common/nixos/overlays

    ./hardware-configuration.nix
    ./variables.nix

    ../../themes/stylix/pinixk.nix
  ];
  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch unless to swap to the one from pregenned cofniguration.nix after install
  system.stateVersion = "24.05";
}

