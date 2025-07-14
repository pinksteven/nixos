{ config, inputs, ... }:

{
  imports = [ ../../system/variables-config.nix ];

  config.var = {
    inherit (inputs.nixos-secrets.hosts.framework) hostname user;
    configDirectory = "/home/" + config.var.user + "/.config/nixos";

    keyboardLayout = "pl";

    location = "Warsaw";
    timeZone = "Europe/Warsaw";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "pl_PL.UTF-8";

    autoUpgrade = true;
    autoGarbageCollection = true;
  };
}
