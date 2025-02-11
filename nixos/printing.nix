{ pkgs, ... }:
{
  services = {
    printing = {
      enable = true;
      openFirewall = true;
      cups-pdf.enable = true;
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
