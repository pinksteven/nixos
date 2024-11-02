{ config, pkgs, ... }:
let 
    username = config.var.username;
    configDirectory = config.var.configDirectory;
    hostname = config.var.hostname;
in {
    programs.zsh = {
        enable = true;
    };
    users = {
        defaultUserShell = pkgs.zsh;
        users.${username} = {
            isNormalUser = true;
            description = "${username} account";
            extraGroups = [ "networkmanager" "wheel" ];
        };
    };
}
