{
  pkgs,
  config,
  ...
}:

{
  imports = [
    ../variables.nix
    ./secrets.nix
    ../../../themes/pine-rose-glass

    # Programs imports
    ../../../hm/programs/shell
    ../../../hm/programs/git
    ../../../hm/programs/kitty
    ../../../hm/programs/lazygit
    ../../../hm/programs/spicetify
    ../../../hm/programs/fantasia
    ../../../hm/programs/yazi
    ../../../hm/programs/nvim
    ../../../hm/programs/nixcord
    ../../../hm/programs/dungeondraft
    ../../../hm/programs/termscp
    ../../../hm/programs/firefox
    ../../../hm/programs/loreforge

    # Scripts
    ../../../hm/scripts # All script courtesy of Hadi

    # DE experience imports
    ../../../hm/system/hyprland
    ../../../hm/system/hypridle
    ../../../hm/system/hyprlock
    ../../../hm/system/hyprpanel
    ../../../hm/system/tofi
    ../../../hm/system/udiskie
    ../../../hm/system/cliphist
    ../../../hm/system/batsignal
    ../../../hm/system/wluma
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
        trayscale
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
