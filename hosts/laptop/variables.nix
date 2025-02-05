{ config, ... }:

{
  imports = [ ../../nixos/variables-config.nix ];

  config.var = {
    hostname = "steven-framework";
    username = "steven";
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    keyboardLayout = "pl";

    location = "Warsaw";
    timeZone = "Europe/Warsaw";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "pl_PL.UTF-8";

    git = {
      username = "Steven";
      email = "st.latuszek@gmail.com";
    };

    autoUpgrade = true;
    autoGarbageCollection = true;
  };
}
