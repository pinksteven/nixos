{
    programs.nixvim.plugins.lazygit = {
        enable = true;
    };

    programs.nixvim.keymaps = [
        {
            mode = "n";
            key = "<leader>gl";
            action = "<cmd>LazyGit<CR>";
        }
    ];
}