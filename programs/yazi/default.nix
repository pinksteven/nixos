{ pkgs, inputs, ... }:
{
  imports = [
    ./keymap.nix
    ./fetchers.nix
    ./open.nix
    ./previewers.nix
    ./termfilechooser.nix
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
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = true;

        linemode = "none";
        show_hidden = false;
        show_symlink = true;
        scrolloff = 5;
        title_format = "Yazi - {cwd}";
      };
      preview = {
        wrap = "yes";
        tab_size = 2;

        max_width = 1000;
        max_height = 1000;
        image_filter = "triangle";
        image_quality = 70;
      };
    };

    plugins = {
      chmod = pkgs.yaziPlugins.chmod;
      full-border = pkgs.yaziPlugins.full-border;
      max-preview = pkgs.yaziPlugins.toggle-pane;
      mount = pkgs.yaziPlugins.mount;
      git = pkgs.yaziPlugins.git;
      lazygit = pkgs.yaziPlugins.lazygit;
      vcs-files = pkgs.yaziPlugins.vcs-files;
      starship = pkgs.yaziPlugins.starship;
      piper = pkgs.yaziPlugins.piper;
      smart-enter = pkgs.yaziPlugins.smart-enter;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()

      if os.getenv("NVIM") then
      	require("hide-preview"):entry()
      end
    '';
  };

  home.packages = with pkgs; [
    ffmpegthumbnailer
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick

    # For custom settings and plugins
    ouch
    eza
    dragon-drop
  ];
}
