{ pkgs, inputs, ... }:
{
  imports = [
    ./keymap.nix
    ./fetchers.nix
    ./previewers.nix
  ];

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
      # plugin = {
      #   prepend_fetchers = [
      #     {
      #       id = "git";
      #       name = "*";
      #       run = "git";
      #     }
      #     {
      #       id = "git";
      #       name = "*/";
      #       run = "git";
      #     }
      #   ];
      #   prepend_previewers = [
      #     {
      #       name = "*/";
      #       run = "eza-preview";
      #     }
      #
      #     # Archive previewer
      #     {
      #       name = "application/*zip";
      #       run = "ouch";
      #     }
      #     {
      #       name = "application/x-tar";
      #       run = "ouch";
      #     }
      #     {
      #       name = "application/x-bzip2";
      #       run = "ouch";
      #     }
      #     {
      #       name = "application/x-7z-compressed";
      #       run = "ouch";
      #     }
      #     {
      #       name = "application/x-rar";
      #       run = "ouch";
      #     }
      #     {
      #       name = "application/x-xz";
      #       run = "ouch";
      #     }
      #   ];
      # };
    };

    plugins = {
      chmod = "${inputs.yazi-plugins}/chmod.yazi";
      full-border = "${inputs.yazi-plugins}/full-border.yazi";
      max-preview = "${inputs.yazi-plugins}/max-preview.yazi";
      hide-preview = "${inputs.yazi-plugins}/hide-preview.yazi";
      mount = "${inputs.yazi-plugins}/mount.yazi";
      git = "${inputs.yazi-plugins}/git.yazi";
      starship = inputs.starship-yazi;
      eza-preview = inputs.eza-preview;
      lazygit = inputs.lazygit-yazi;
      ouch = inputs.ouch-yazi;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()

      if os.getenv("NVIM") then
      	require("hide-preview"):entry()
      end
    '';

    # keymap = {
    #   manager.prepend_keymap = [
    #     {
    #       on = [
    #         "T"
    #         "m"
    #       ];
    #       run = "plugin --sync max-preview";
    #       desc = "Maximize preview";
    #     }
    #     {
    #       on = [
    #         "T"
    #         "h"
    #       ];
    #       run = "plugin --sync hide-preview";
    #       desc = "Hide preview";
    #     }
    #     {
    #       on = [
    #         "c"
    #         "m"
    #       ];
    #       run = "plugin chmod";
    #       desc = "Chmod files";
    #     }
    #     {
    #       on = [
    #         "g"
    #         "g"
    #       ];
    #       run = "plugin lazygit";
    #       desc = "lazygit";
    #     }
    #     {
    #       on = [ "C" ];
    #       run = "plugin ouch --args=zip";
    #       desc = "Compress files";
    #     }
    #   ];
    # };
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

    ouch
  ];
}
