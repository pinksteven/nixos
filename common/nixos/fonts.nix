{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "FiraMono Nerd Font Mono"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "FiraMono Nerd Font Mono"
          "Noto Color Emoji"
        ];
        serif = [
          "FiraMono Nerd Font Mono"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}

