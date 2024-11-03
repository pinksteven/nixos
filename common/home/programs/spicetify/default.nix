# Spicetify is a spotify client customizer
{ pkgs, config, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  accent = "${config.lib.stylix.colors.base0D}";
in {
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];

  stylix.targets.spicetify.enable = true;

  programs.spicetify = {
    enable = true;
    #theme = spicePkgs.themes.dribbblish;

    #colorScheme = "custom";

    customColorScheme = {
      button = accent;
      button-active = accent;
      tab-active = accent;
    };

    enabledExtensions = with spicePkgs.extensions; [
      bookmark
      fullAppDisplay
      keyboardShortcut
      shuffle

      playlistIcons
      history
      betterGenres
      lastfm
      hidePodcasts
    ];
  };
}