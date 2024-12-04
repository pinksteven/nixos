{ config, ... }:
let
  base00 = "#${config.lib.stylix.colors.base00}";
  base0D = "#${config.lib.stylix.colors.base0D}";
  base0E = "#${config.lib.stylix.colors.base0E}";
in
{
  programs.nixvim.plugins.startup = {
    enable = true;

    colors = {
      background = base00;
      foldedSection = base00;
    };

    sections = {
      header = {
        type = "text";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Header";
        margin = 5;
        content = [
          " ███╗░░░██╗███████╗░██████╗░██╗░░░██╗██╗███╗░░░███╗ "
          " ████╗░░██║██╔════╝██╔═══██╗██║░░░██║██║████╗░████║ "
          " ██╔██╗░██║█████╗░░██║░░░██║██║░░░██║██║██╔████╔██║ "
          " ██║╚██╗██║██╔══╝░░██║░░░██║╚██╗░██╔╝██║██║╚██╔╝██║ "
          " ██║░╚████║███████╗╚██████╔╝░╚████╔╝░██║██║░╚═╝░██║ "
          " ╚═╝░░╚═══╝╚══════╝░╚═════╝░░░╚═══╝░░╚═╝╚═╝░░░░░╚═╝ "
        ];
        highlight = "";
        defaultColor = base0D;
        oldfilesAmount = 0;
      };
      body = {
        type = "mapping";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Menu";
        margin = 5;
        content = [
          [
            " Last Session"
            "lua require'persistence'.load({last = true})"
            "ls"
          ]
          [
            " New File"
            "lua require'startup'.new_file()"
            "nf"
          ]
          [
            " Find File"
            "Telescope find_files"
            "ff"
          ]
          [
            "󰍉 Find Word"
            "Telescope live_grep"
            "fr"
          ]
          [
            " Sessions"
            "lua require'persistence'.select()"
            "fg"
          ]
          [
            "󰉋 File Browser"
            "Yazi"
            "fe"
          ]
        ];
        highlight = "";
        defaultColor = base0E;
        oldfilesAmount = 0;
      };
    };
    options = {
      paddings = [
        1
        3
      ];
    };
    parts = [
      "header"
      "body"
    ];
  };
}
