{ config, ... }:
let 
    bg = config.lib.stylix.colors.base00;
    close = config.lib.stylix.colors.base08;
    maximize = config.lib.stylix.colors.base09;
    text = config.lib.stylix.colors.base05;

    font = config.var.theme.desktopFont;
    fontSize = "${toString config.stylix.fonts.sizes.desktop}";
in {
    
    wayland.windowManager.hyprland.settings = {
        plugin = {
            hyprbars = {
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
#            overview = { autoDrag = false; };
#            dynamic-cursors = {
#	            enabled = true;
#	            mode = "tilt";
#	            threshold = 1;
#	            tilt = {
#	                # controls how powerful the tilt is, the lower, the more power
#	                # this value controls at which speed (px/s) the full tilt is reached
#	                limit = 3000;
# 	                # relationship between speed and tilt, supports these values:
#	                # linear             - a linear function is used
#	                # quadratic          - a quadratic function is used (most realistic to actual air drag)
#                    # negative_quadratic - negative version of the quadratic one, feels more aggressive
#                    function = "negative_quadratic";
#                };
#                shake = {
#
#                    # enables shake to find
#                    enabled = true;
#
#                    # use nearest-neighbour (pixelated) scaling when shaking
#                    # may look weird when effects are enabled
#                    nearest = true;
#
#                    # controls how soon a shake is detected
#                    # lower values mean sooner
#                    threshold = 5.0;
#
#                    # magnification level immediately after shake start
#                    base = 3.0;
#                    # magnification increase per second when continuing to shake
#                    speed = 1.5;
#                    # how much the speed is influenced by the current shake intensitiy
#                    influence = 0.0;
#
#                    # maximal magnification the cursor can reach
#                    # values below 1 disable the limit (e.g. 0)
#                    limit = 10.0;
#
#                    # time in millseconds the cursor will stay magnified after a shake has ended
#                    timeout = 2000;
#
#                    # show cursor behaviour `tilt`, `rotate`, etc. while shaking
#                    effects = false;
#                };
#            };
        };
    };
}
