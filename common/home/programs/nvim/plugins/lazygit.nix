{
    packages.nixvim.plugins.lazygit = {
        enable = true;
    };

    packages.nixvim.keymaps = [
        {
            mode = "n";
            key = "<leader>gl";
            action = "<cmd>LazyGit<CR>";
        }
    ];
}