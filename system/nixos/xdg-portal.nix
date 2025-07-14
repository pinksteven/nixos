{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = [
          "termfilechooser"
          "gtk"
        ];
        hyprland = {
          default = [
            "termfilechooser"
            "gtk"
            "hyprland"
          ];
          "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
        };
      };

      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-termfilechooser
      ];
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [ "kitty.desktop" ];
      };
    };
  };
}
