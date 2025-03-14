{
  pkgs,
  inputs,
  config,
  ...
}:
let
  theme = pkgs.runCommand "reewal-theme" { } ''
    mkdir $out
    cd $out
    ${inputs.reewal.defaultPackage."${pkgs.system}"}/bin/reewal ${config.stylix.image} theme.yaml
  '';
in
{
  stylix = {
    enable = true;

    base16Scheme = "${theme}/theme.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    opacity = {
      applications = 1.0;
      desktop = 0.6;
      popups = 0.85;
      terminal = 0.85;
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

    image = "${inputs.wallpapers}/" + "dandadan_yes.jpg";
  };
}
