{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>Neotree action=focus reveal toggle<CR>";
      options = {
        desc = "Explorer toggle";
      };
    }
  ];

  programs.nixvim.plugins.neo-tree = {
    enable = true;

    closeIfLastWindow = true;
    autoCleanAfterSessionRestore = true;

    filesystem = {
      filteredItems = {
        hideDotfiles = false;
        hideHidden = false;
        hideGitignored = true;
        neverShowByPattern = [
          ".direnv"
          ".git"
          ".gitignore"
        ];
        visible = true;
      };

      followCurrentFile.enabled = true;

      useLibuvFileWatcher.__raw = ''vim.fn.has "win32" ~= 1'';
    };

    buffers = {
      followCurrentFile.enabled = true;
    };

    window = {
      width = 30;
    };
  };
}
