{
    programs.nixvim.keymaps = [{
        mode = "n";
        key = "<leader>E";
        action = "<cmd>Neotree action=focus reveal toggle<CR>";
        options = {
            desc = "Explorer toggle";
        };
    }];

    programs.nixvim.plugins.neo-tree = {
        enable = true;

        closeIfLastWindow = true;

        filesystem = {
            filteredItems = {
                hideDotfiles = false;
                hideHidden = false;
                hideGitignored = true;
                neverShowByPattern = [
                    ".direnv"
                    ".git"
                ];
                visible = true;
            };

            followCurrentFile = {
                enabled = true;
                leaveDirsOpen = false;
            };

            useLibuvFileWatcher.__raw = ''vim.fn.has "win32" ~= 1'';
        };

        window = {
            width = 30;
            autoExpandWidth = false;
        };
    };
}
