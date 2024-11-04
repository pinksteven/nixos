# Spicetify is a spotify client customizer
{ pkgs, config, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};

  base00 = "${config.lib.stylix.colors.base00}";
  base01 = "${config.lib.stylix.colors.base01}";
  base02 = "${config.lib.stylix.colors.base02}";
  base03 = "${config.lib.stylix.colors.base03}";
  base04 = "${config.lib.stylix.colors.base04}";
  base05 = "${config.lib.stylix.colors.base05}";
  base06 = "${config.lib.stylix.colors.base06}";
  base07 = "${config.lib.stylix.colors.base07}";
  base08 = "${config.lib.stylix.colors.base08}";
  base09 = "${config.lib.stylix.colors.base09}";
  base0A = "${config.lib.stylix.colors.base0A}";
  base0B = "${config.lib.stylix.colors.base0B}";
  base0C = "${config.lib.stylix.colors.base0C}";
  base0D = "${config.lib.stylix.colors.base0D}";
  base0E = "${config.lib.stylix.colors.base0E}";
  base0F = "${config.lib.stylix.colors.base0F}";
in {
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];

  stylix.targets.spicetify.enable = false;

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.dribbblish;

    #colorScheme = "custom";

    customColorScheme = {
      text               = base05;
      subtext            = base04;
      sidebar-text       = base05;
      main               = base00;
      sidebar            = base01;
      player             = base00;
      card               = base00;
      shadow             = base01;
      selected-row       = base06;
      button             = base0D;
      button-active      = base0D;
      button-disabled    = base04;
      tab-active         = base02;
      notification       = base02;
      notification-error = base08;
      misc               = base03;
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