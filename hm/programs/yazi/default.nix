{ pkgs, inputs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {
        ratio = [
          2
          5
          3
        ];
        sort_by = "natural";
        sort_dir_first = true;
        sort_translit = true;
      };
      preview = {
        wrap = "yes";
        tab_size = 2;
        max_width = 1000;
        max_height = 1000;
      };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
        prepend_previewers = [
          {
            name = "*/";
            run = "eza-preview";
          }
        ];
      };
    };

    plugins = {
      chmod = "${inputs.yazi-plugins}/chmod.yazi";
      full-border = "${inputs.yazi-plugins}/full-border.yazi";
      max-preview = "${inputs.yazi-plugins}/max-preview.yazi";
      hide-preview = "${inputs.yazi-plugins}/hide-preview.yazi";
      git = "${inputs.yazi-plugins}/git.yazi";
      starship = inputs.starship-yazi;
      eza-preview = inputs.eza-preview;
      lazygit = inputs.lazygit-yazi;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()

      if os.getenv("NVIM") then
      	require("hide-preview"):entry()
      end
    '';

    keymap = {
      manager.prepend_keymap = [
        {
          on = [
            "T"
            "m"
          ];
          run = "plugin --sync max-preview";
          desc = "Maximize preview";
        }
        {
          on = [
            "T"
            "h"
          ];
          run = "plugin --sync hide-preview";
          desc = "Hide preview";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod files";
        }
        {
          on = [
            "g"
            "g"
          ];
          run = "plugin lazygit";
          desc = "lazygit";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    ffmpegthumbnailer
    jq
    poppler
    fd
    ripgrep
    imagemagick
  ];
}
