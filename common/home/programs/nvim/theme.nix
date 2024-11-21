{ config, ... }:
let
    base00 = "#${config.lib.stylix.colors.base00}";
    base01 = "#${config.lib.stylix.colors.base01}";
    base02 = "#${config.lib.stylix.colors.base02}";
    base03 = "#${config.lib.stylix.colors.base03}";
    base04 = "#${config.lib.stylix.colors.base04}";
    base05 = "#${config.lib.stylix.colors.base05}";
    base06 = "#${config.lib.stylix.colors.base06}";
    base07 = "#${config.lib.stylix.colors.base07}";
    base08 = "#${config.lib.stylix.colors.base08}";
    base09 = "#${config.lib.stylix.colors.base09}";
    base0A = "#${config.lib.stylix.colors.base0A}";
    base0B = "#${config.lib.stylix.colors.base0B}";
    base0C = "#${config.lib.stylix.colors.base0C}";
    base0D = "#${config.lib.stylix.colors.base0D}";
    base0E = "#${config.lib.stylix.colors.base0E}";
    base0F = "#${config.lib.stylix.colors.base0F}";
in {
    stylix.targets.nixvim.enable = false;

    programs.nixvim.colorschemes.base16 = {
        enable = true;

        colorscheme = {
            base00 = $base00;
            base01 = $base01;
            base02 = $base02;
            base03 = $base03;
            base04 = $base04;
            base05 = $base05;
            base06 = $base06;
            base07 = $base07;
            base08 = $base08;
            base09 = $base09;
            base0A = $base0A;
            base0B = $base0B;
            base0C = $base0C;
            base0D = $base0D;
            base0E = $base0E;
            base0F = $base0F;
        };
        setUpBar = true;
    };
}
