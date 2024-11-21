{
    imports = [
        ./lualine.nix
        ./mini
        ./gitsigns.nix
        ./telescope.nix
        ./which-key.nix
        ./lazygit.nix
        ./yazi.nix
        ./neo-tree.nix
    ];
    programs.nixvim.plugins.barbar.enable = true;
}
