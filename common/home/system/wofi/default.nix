{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [ wofi-emoji ];

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
        };
    };

    stylix.targets.wofi.enable = true;
}
