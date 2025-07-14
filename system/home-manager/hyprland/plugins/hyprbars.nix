{
  inputs,
  pkgs,
  config,
  ...
}:
let
  bg = config.lib.stylix.colors.base00;
  close = config.lib.stylix.colors.base08;
  maximize = config.lib.stylix.colors.base09;
  text = config.lib.stylix.colors.base05;

  font = config.stylix.fonts.serif.name;
  fontSize = "${toString config.stylix.fonts.sizes.desktop}";
in
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprbars ];
    settings.plugin.hyprbars = {
      bar_height = 20;
      bar_part_of_window = true;
      bar_precedence_over_border = true;
      bar_padding = 10;
      bar_button_padding = 5;

      bar_text_font = font;
      bar_text_size = fontSize;

      bar_color = "rgb(${bg})";
      col.text = "rgb(${text})";

      hyprbars-button = [
        "rgb(${close}), 15, 󰖭, hyprctl dispatch killactive"
        "rgb(${maximize}), 15, 󰊓, hyprctl dispatch fullscreen 1"
      ];
    };
  };
}
