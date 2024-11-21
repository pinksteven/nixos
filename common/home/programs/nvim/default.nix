{ inputs, ... }:

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
        ./options.nix
        ./filetypes.nix
        ./autocmd.nix
        ./diagnostic.nix
        ./plugins
    ];

    stylix.targets.nixvim = {
        enable = true;
        plugin = "base16-nvim";
    };

    programs.nixvim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
    };
}
