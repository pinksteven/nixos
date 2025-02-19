{
  pkgs,
  lib,
  config,
  ...
}:

{

  home.packages = with pkgs; [
    bat
    ripgrep
    tldr
    thefuck
    microfetch
  ];

  home.sessionPath = [ "$HOME/go/bin" ];

  home.shell.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    initExtraFirst = ''
      bindkey -e
      bindkey "^[[3~" delete-char
      microfetch

    '';

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
    };

    profileExtra = lib.optionalString (config.home.sessionPath != [ ]) ''
      export PATH="$PATH''${PATH:+:}${lib.concatStringsSep ":" config.home.sessionPath}"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "thefuck"
        "tailscale"
        "docker"
        "docker-compose"
      ];
    };

    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      v = "nvim";
      c = "clear";
      clera = "clear";
      celar = "clear";
      e = "exit";
      cd = "z";
      ls = "eza --icons=always --no-quotes";
      tree = "eza --icons=always --tree --no-quotes";
      sl = "ls";
      open = "${pkgs.xdg-utils}/bin/xdg-open";
      icat = "kitty +kitten icat";
      ssh = "kitty +kitten ssh";
      yoink = "nh os switch -a";
      yeet = "nh clean all --keep 3";
      vimgrab = "nix flake update nixvim --flake ${config.var.configDirectory}";
      rollback = "sudo nixos-rebuild switch --rollback --flake ${config.var.configDirectory}";
      tofi-regen = "rm ${config.home.homeDirectory}/.cache/tofi-drun";

      # git
      g = "lazygit";
      ga = "git add";
      gc = "git commit";
      gcu = "git add . && git commit -m 'Update'";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
      gd = "git diff";
      gco = "git checkout";
      gcb = "git checkout -b";
      gbr = "git branch";
      grs = "git reset HEAD~1";
      grh = "git reset --hard HEAD~1";

      gaa = "git add .";
      gcm = "git commit -m";
    };
  };
}
