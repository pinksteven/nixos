{ config, lib, ... }:
{
    programs.nixvim.plugins.mini = {
        enable = true;

        modules.map = {
            # __raw = lua code
            # __unkeyed.* = no key, just the value
            integrations = {
                "__unkeyed.builtin_search".__raw = "require('mini.map').gen_integration.builtin_search()";
                "__unkeyed.gitsigns".__raw = "require('mini.map').gen_integration.gitsigns()";
                "__unkeyed.diagnostic".__raw = "require('mini.map').gen_integration.diagnostic()";
            };

            window = {
                winblend = 0;
            };
        };
    };

    programs.nixvim.keymaps = [
        {
        mode = "n";
        key = "<leader>um";
        action.__raw = "MiniMap.toggle";
        options = {
            desc = "MiniMap toggle";
            silent = true;
        };
        }
    ];
}