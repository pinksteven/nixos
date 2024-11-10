{ config, pkgs, lib, ... }:
let
  accent = "#${config.lib.stylix.colors.base0D}";
  background = "#${config.lib.stylix.colors.base00}";
  background-alt = "#${config.lib.stylix.colors.base01}";
  foreground = "#${config.lib.stylix.colors.base05}";
  font = config.stylix.fonts.serif.name;
  rounding = config.var.theme.rounding;
  font-size = config.stylix.fonts.sizes.applications*1.3;
  border-size = config.var.theme.border-size;
  border-color = "#${config.lib.stylix.colors.base0D}";
in {
    home.packages = with pkgs; [ wofi-emoji ];
    stylix.targets.wofi.enable = false;

    programs.wofi = {
        enable = true;

        settings = {
            allow_markup = true;
            width = "40%";
            show = "drun";
            prompt = "Apps";
            normal_window = false;
            layer = "top";
            height = "60%";
            orientation = "vertical";
            halign = "fill";
            line_wrap = "off";
            dynamic_lines = false;
            allow_images = true;
            image_size = 32;
            exec_search = false;
            hide_search = false;
            parse_search = false;
            insensitive = true;
            hide_scroll = false;
            no_actions = true;
            sort_order = "default";
            gtk_dark = true;
            filter_rate = 100;
            key_expand = "Tab";
            key_exit = "Escape";
            term = "kitty";
        };
        style = # css
        ''
            * {
                font-family: "${font}";
                font-weight: 500;
                font-size: ${toString font-size}px;
            }
            #window {
                background-color: ${background};
                color: ${foreground};
                border-radius: ${toString rounding}px;
                border: ${toString border-size}px solid ${border-color};
            }

            #outer-box {
                padding: 20px;
            }

            #input {
                background-color: ${background-alt};
                border: 0px solid ${accent};
                color: ${foreground};
                padding: 8px 12px;
            }

            #scroll {
                margin-top: 20px;
            }

            #inner-box {}

            #img {
                padding-right: 8px;
            }

            #text {
                color: ${foreground};
            }

            #text:selected {
                color: ${background-alt};
            }

            #entry {
                padding: 6px;
            }

            #entry:selected {
                background-color: ${accent};
                color: ${background-alt};
            }

            #input,
            #entry:selected {
                border-radius: ${toString rounding}px;
            }
        '';
    };
}
