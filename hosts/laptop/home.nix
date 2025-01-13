{ pkgs, config, ... }:

{
  imports = [
    ./variables.nix

    # Programs imports
    ../../common/home/programs/shell
    ../../common/home/programs/git
    ../../common/home/programs/kitty
    ../../common/home/programs/lazygit
    ../../common/home/programs/nerdfetch
    ../../common/home/programs/spicetify
    ../../common/home/programs/trayscale
    ../../common/home/programs/vesktop
    # ../../common/home/programs/fantasia
    ../../common/home/programs/yazi
    ../../common/home/programs/nvim
    ../../common/home/programs/nixcord

    # Scripts
    ../../common/home/scripts # All script courtesy of Hadi

    # DE experience imports
    ../../common/home/system/hyprland
    ../../common/home/system/hypridle
    ../../common/home/system/hyprlock
    ../../common/home/system/hyprpanel
    ../../common/home/system/wofi
    ../../common/home/system/udiskie
    ../../common/home/system/cliphist
    ../../common/home/system/batsignal
    ../../common/home/system/wlogout
  ];
  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    # Import packages without setting their options in nix files (1 line installs only)
    packages = with pkgs; [
      firefox
      clapper
      vscode
      easyeffects
      syncthing
      logseq

      libreoffice-fresh
      hunspell
      hunspellDicts.pl_PL

      zip
      unzip
      btop
      cloc
    ];

    # Don't touch
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
