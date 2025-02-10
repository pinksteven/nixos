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
        sort_sensitive = true;
        sort_dir_first = true;
        sort_translit = true;
      };
      preview = {
        wrap = "yes";
        tab_size = 2;
        max_width = 1000;
        max_height = 1000;
      };
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
