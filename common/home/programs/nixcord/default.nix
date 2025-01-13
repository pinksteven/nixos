{ inputs, ... }:
{
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
    ./theme.nix
  ];
  programs.nixcord = {
    enable = true;
    config = {
      useQuickCss = true;
      frameless = true;
      disableMinSize = true;
      themeLinks = [ "https://refact0r.github.io/midnight-discord/midnight.css" ];
      enabledThemes = [ "nixnight.css" ];
    };
  };
}
