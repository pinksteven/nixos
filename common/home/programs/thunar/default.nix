# Thunar is a file explorer
{ pkgs, ... }: 

{
    home.packages = with pkgs.xfce; [
        thunar
        xfconf
        tumbler
        thunar-archive-plugin
        thunar-volman
    ];
}