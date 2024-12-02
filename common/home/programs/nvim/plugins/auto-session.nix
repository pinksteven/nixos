{
  programs.nixvim.plugins = {
    auto-session = {
      enable = true;
      luaConfig.pre = ''
        vim.o.sessionoptions=
          "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
      '';
    };
  };
}
