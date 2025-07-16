{ config, pkgs, ... }:

{
  imports = [
    ../../system/nixos/audio.nix
    ../../system/nixos/auto-upgrade.nix
    ../../system/nixos/docker.nix
    ../../system/nixos/fonts.nix
    ../../system/nixos/greetd.nix
    ../../system/nixos/home-manager.nix
    ../../system/nixos/network-manager.nix
    ../../system/nixos/nix.nix
    ../../system/nixos/printing.nix
    ../../system/nixos/sudo.nix
    ../../system/nixos/systemd-boot.nix
    ../../system/nixos/timezone.nix
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

  # Setting up NVIDIA to work well
  hardware = {
    graphics.enable = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    enabled = true;
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement.enable = true;
  };
  environment.systemPackages = with pkgs; [
    egl-wayland
  ];

  home-manager.users."${config.var.user}" = import ./home;
  home-manager.sharedModules = [ { stylix.enable = true; } ];

  # Don't touch unless to swap to the one from pregenned cofniguration.nix after install
  system.stateVersion = "25.05";
}
