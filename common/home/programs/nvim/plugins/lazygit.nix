{
    programs.nixvim.plugins.lazygit = {
        enable = true;
    };

    programs.nixvim.keymaps = [
        {
            mode = "n";
            key = "<leader>gl";
            action = "<cmd>LazyGitCurrentFile<CR>";
            options.desc = "Open lazygit";
        }
    ];

    programs.nixvim.autoCmd = [
        {
          event = "BufLeave";
          pattern = "*lazygit*";
          callback = { __raw = #Lua
          ''
            function()
		      require("neo-tree.sources.filesystem.commands").refresh(
			    require("neo-tree.sources.manager").get_state("filesystem")
		      )
		    end
          '';
          };
        }
    ];
}
