{
  pkgs,
  config,
  ...
}:

{
  imports = [
    ../variables.nix
    ./secrets.nix
    ./hyprland.nix # System specific hyprland settings
    ./wluma.nix
    ../../../themes/pine-rose-glass

    # Programs imports
    ../../../programs/shell
    ../../../programs/git
    ../../../programs/kitty
    ../../../programs/lazygit
    ../../../programs/spicetify
    ../../../programs/yazi
    ../../../programs/nvim
    ../../../programs/nixcord
    ../../../programs/dungeondraft
    ../../../programs/termscp
    ../../../programs/firefox
    ../../../programs/loreforge
    ../../../programs/trayscale

    # Scripts
    ../../../programs/scripts # All script courtesy of Hadi

    # DE experience imports
    ../../../system/home-manager/hyprland
    ../../../system/home-manager/hypridle
    ../../../system/home-manager/hyprlock
    ../../../system/home-manager/caelestia-shell
    ../../../system/home-manager/tofi
    ../../../system/home-manager/udiskie
    ../../../system/home-manager/cliphist
    ../../../system/home-manager/batsignal
  ];
  home = {
    username = config.var.user;
    homeDirectory = "/home/" + config.var.user;

    # Import packages without setting their options in nix files (1 line installs only)
    packages =
      with pkgs;
      let
        alpaca = pkgs.alpaca.override { ollama = pkgs.ollama-rocm; };
      in
      [
        clapper
        easyeffects
        syncthing
        moonlight-qt
        gdlauncher-carbon
        alpaca

        libreoffice-fresh
        hunspell
        hunspellDicts.pl_PL

        zip
        unzip
        btop
        cloc
        sshfs
      ];

    # Don't touch
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
