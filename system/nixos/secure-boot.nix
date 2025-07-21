{ pkgs, lib, ... }:
{
  environment.systemPackages = [ pkgs.sbctl ];

  boot.loader.systemdBoot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
