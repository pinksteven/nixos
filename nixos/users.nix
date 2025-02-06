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
    users.${user} = {
      isNormalUser = true;
      description = "${user} account";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
