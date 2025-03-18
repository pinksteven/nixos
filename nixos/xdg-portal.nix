{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland = {
        default = [
          "termfilechooser"
          "gtk"
          "hyprland"
        ];
      };
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-termfilechooser
    ];
  };
}
