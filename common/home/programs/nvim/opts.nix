{
    programs.nixvim.globals.mapleader = " ";
    programs.nixvim.opts = {
        updatetime = 50;

        number = true;
        relativenumber = true;

        autoindent = true;
        clipboard = "unnamed,unnamedplus";

        expandtab = true;
        softtabstop = 4;
        shiftwidth = 4;
        smartindent = true;
        breakindent = true;

        ignorecase = true;
        smartcase = true;
        incsearch = true;
        hlsearch = true;
        wildmode = "list:longest";
        completeopt = [ "menuone" "noinsert" "noselect" "preview" ];
        signcolumn = "yes";
        cursorline = true;
        scrolloff = 8;
        mouse = "a";
        termguicolors = true;

        wrap = false;

        swapfile = false;
        undofile = true;
        conceallevel = 3;
    };
    programs.nixvim.extraConfigLua = "vim.o.breakindentopt = \"shift:2\"";# vim.opt doesn't work for this setting
}
