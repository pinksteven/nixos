{
  imports = [
    ./surround.nix
    ./bufremove.nix
    ./comment.nix
    ./diff.nix
    ./indentscope.nix
    ./fuzzy.nix
    ./map.nix
    ./starter.nix
  ];
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;

      modules = {
        icons = { };
        ai = { };
        cursorword = { };
        operators = { };
        pairs = { };
        basics = { };
        bracketed = { };
        align = { };
        git = { };
      };
    };
  };
}

