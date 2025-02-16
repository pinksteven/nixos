# Spicetify is a spotify client customizer
{
  pkgs,
  config,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  stylix.targets.spicetify.enable = false;

  programs.spicetify = {
    enable = true;
    theme = {
      name = "Comfy";
      src = "${inputs.spicetify-comfy}/Comfy";
      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      overwriteAssets = true;

      extraCommands = ''
        # remove the auto-update functionality
        echo "\n" >> ./Extensions/theme.js
        cat ./Themes/Comfy/theme.script.js >> ./Extensions/theme.js
      '';
    };

    colorScheme = "custom";

    customColorScheme = with config.lib.stylix.colors; {
      text = base05;
      subtext = base04;
      main = base01;
      main-elevated = base02;
      main-transition = base01;
      highlight = base07;
      highlight-elevated = base0D;
      sidebar = base00;
      player = base01;
      card = base07;
      shadow = base07;
      selected-row = base05;
      button = base0E;
      button-active = base0E;
      button-disabled = base03;
      tab-active = base07;
      notification = base0C;
      notification-error = base08;
      misc = base05;
      play-button = base0D;
      play-button-active = base0D;
      progress-fg = base0D;
      progress-bg = base02;
      heart = base08;
      pagelink-active = base0A;
      radio-btn-active = base0C;
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

  xdg.desktopEntries.spotify = {
    type = "Application";
    name = "Spotify";
    genericName = "Music Player";
    icon = "spotify-client";
    exec = "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
    categories = [
      "Audio"
      "Music"
      "Player"
      "AudioVideo"
    ];
    mimeType = [ "x-scheme-handler/spotify" ];
    terminal = false;
    settings = {
      TryExec = "spotify";
      StartupWMClass = "spotify";
    };
  };
}
