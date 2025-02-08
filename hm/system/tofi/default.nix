{ config, lib, ... }:
with config.stylix.fonts;
with config.lib.stylix.colors.withHashtag;
{
  stylix.targets.tofi.enable = false;

  programs.tofi = {
    enable = true;
    settings =
      let
        opacity = lib.toHexString (builtins.ceil (config.stylix.opacity.desktop * 255));
      in
      {
        font = serif.name;
        font-size = sizes.applications;

        background-color = base00 + opacity;

        selection-background = base02 + opacity;
        selection-background-corner-radius = config.var.theme.rounding;
        selection-background-padding = sizes.applications;

        text-color = base05;
        prompt-color = base0E;
        input-color = base0D;
        selection-color = base0D;

        width = "100%";
        height = "100%";
        border-width = 0;
        outline-width = 0;
        padding-left = "42%";
        padding-right = "42%";
        padding-top = "30%";
        padding-bottom = "20%";
        result-spacing = sizes.applications * 2;
      };
  };
}
