{ pkgs, inputs, ... }:
{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
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
        tab_size = 4;
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
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "T"
            "h"
          ];
          run = "plugin --sync hide-preview";
          desc = "Hide or show preview";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          on = [
            "g"
            "i"
          ];
          run = "plugin lazygit";
          desc = "run lazygit";
        }
      ];
    };
  };

  # This is very scuffed but idc
  xdg.desktopEntries.yazi = {
    name = "Yazi";
    icon = "yazi";
    comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
    genericName = "File Manager";
    exec = ''kitty --class=yazi zsh -c "yazi %u; exit"'';
    terminal = false;
    type = "Application";
    mimeType = [ "inode/directory" ];
    categories = [
      "Utility"
      "Core"
      "System"
      "FileTools"
      "FileManager"
      "ConsoleOnly"
    ];
    settings = {
      TryExec = "yazi";
      Keywords = "File;Manager;Explorer;Browser;Launcher";
      StartupWMClass = "yazi";
    };
  };

  home.packages = with pkgs; [
    ffmpeg
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick
    zip
    unzip
  ];
}
