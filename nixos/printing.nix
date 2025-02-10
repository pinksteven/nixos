{ pkgs, ... }:
{
  services = {
    printing = {
      enable = true;
      openFirewall = true;
      drivers = [
        pkgs.epson-escpr
        pkgs.gutenprint
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
