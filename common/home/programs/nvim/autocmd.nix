{
  programs.nixvim.autoCmd = [

    # Open minimap on first buffer
    # {
    #   event = "BufRead";
    #   once = true;
    #   callback = {
    #     __raw =
    #       "MiniMap.open";
    #   };
    # }

    # Open Neo-Tree on first buffer
    # {
    #   event = "BufWinEnter";
    #   callback = {
    #     __raw =
    #       ''
    #         function(table)
    #           if vim.api.nvim_buf_get_name(0) ~= "" and not vim.g.first_buffer_opened then
    #             vim.g.first_buffer_opened = true
    #             vim.api.nvim_exec('Neotree show filesystem left', true)
    #           end
    #         end
    #       '';
    #   };
    # }

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
      event = "VimEnter";
      command = ''!hyprctl dispatch settiled "title:^(.*NVIM.*)$" --quiet'';
    }
  ];
}
