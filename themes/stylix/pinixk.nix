{ pkgs, inputs, ... }:

{
  home-manager.sharedModules = [ { stylix.enable = true; } ];
  stylix = {
    enable = true;
    targets.plymouth.enable = false;

    base16Scheme = "${inputs.tinted-theming}/base16/" + "rose-pine.yaml";

    # cursor = {
    #   package = pkgs.bibata-cursors;
    #   name = "Bibata-Modern-Ice";
    #   size = 24;
    # };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "FiraMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerdfonts;
        name = "FiraMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.nerdfonts;
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

    image = ./Wallpapers/dandadan_yes.jpg;
  };

}
