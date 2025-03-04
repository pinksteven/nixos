{ pkgs, ... }:
{
  services = {
    printing = {
      enable = true;
      listenAddresses = [ "*:631" ];
      browsing = true;
      defaultShared = true;
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
      publish = {
        enable = true;
        userServices = true;
      };
    };
  };
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Epson_L4260_Series";
        location = "Home";
        deviceUri = "dnssd://EPSON%20L4260%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-e0bb9e051c64";
        model = "epson-inkjet-printer-escpr/Epson-L4260_Series-epson-escpr-en.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "Epson_L4260_Series";
  };
}
