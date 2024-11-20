{ lib, config, ... }:
{
    programs.nixvim.plugins.mini = {
        enable = true;
        modules.diff.view.style = "sign";
    };

    programs.nixvim.keymaps = [
        {
        mode = "n";
        key = "<leader>ugo";
        action.__raw = "MiniDiff.toggle_overlay";
        options = {
            desc = "Git Overlay toggle";
            silent = true;
        };
        }
    ];
}