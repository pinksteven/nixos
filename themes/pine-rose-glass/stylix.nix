{ pkgs, inputs, ... }:

{
  # home-manager.sharedModules = [ { stylix.enable = true; } ];

  stylix = {
    enable = true;

    base16Scheme = "${inputs.tinted-theming}/base16/" + "rose-pine.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    opacity = {
      applications = 1.0;
      desktop = 0.6;
      popups = 0.9;
      terminal = 0.9;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraMono Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 11;
      };
    };

    image = "${inputs.wallpapers}/" + "more_dandadan.jpeg";
  };
}
