{
  programs.nixvim.autoCmd = [
    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = [
        "tex"
        "latex"
        "markdown"
      ];
      command = "setlocal spell spelllang=en_us";
    }
    {
      event = "BufLeave";
      pattern = "*lazygit*";
      callback.__raw = ''
        function()
          require("neo-tree.sources.filesystem.commands").refresh(
        		require("neo-tree.sources.manager").get_state("filesystem")
        	)
        end
      '';
    }
    # Tile neovim on entering
    {
      event = "UIEnter";
      command = ''call timer_start(100, {tid -> execute('!hyprctl dispatch settiled "title:^(.*NVIM.*)$" --quiet')})'';
      once = true;
    }
    # Untile on exit
    {
      event = "VimLeave";
      command = ''!hyprctl dispatch setfloating "title:^(.*NVIM.*)$" --quiet'';
    }
  ];
}
