{ config, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
  };
  users.users.${config.var.user}.extraGroups = [ "docker" ];
}
