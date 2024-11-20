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

    programs.nixvim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
    };
}