{ config, ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      drun-launch = true;

      font = "monospace";
      font-size = config.stylix.fonts.sizes.applications;

      width = "40%";
      height = "60%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
    };
  };
}
