{ inputs, ... }:

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
        ./options.nix
        ./filetypes.nix
    ];

    programs.nixvim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
    };
}