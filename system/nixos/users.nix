{ config, pkgs, ... }:
let
  inherit (config.var) user;
in
{
  programs.zsh = {
    enable = true;
  };
  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.${user} = {
      isNormalUser = true;
      description = "${user} account";
      hashedPasswordFile = config.sops.secrets."passwords/steven".path;
      extraGroups = [
        "networkmanager"
        "bluetooth"
        "wheel"
        "gamemode"
        "tss"
      ];
    };
  };
}
