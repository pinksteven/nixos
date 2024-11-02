{ pkgs, ... }: 

{
  hardware.enableAllFirmware = true; # Enable all firmware regardless of license
  # Set up systemd-boot with plymouth
  boot = {
    # Enable end set up systemd-boot
    loader = {
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "auto";
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_zen;
 
    # Make boot silent in nevery way i can
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = ["quiet" "splash" "loglevel=3" "rd.udev.log_level=3" "rd.udev.log_priority=3"];

    # Enable and config plymouth
    plymouth.enable = true;
  };
}
