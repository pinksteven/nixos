{ config, ...}:

{
    virtualisation.docker = {
        rootless.enable = true;
        rootless.setSocketVariable = true;
        enableOnBoot = true;
        storageDriver = "btrfs";
    };
}