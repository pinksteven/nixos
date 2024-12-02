{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.bigblue-terminal
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "FiraCode Nerd Font Mono"
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
