{
  programs.nixvim.plugins = {
    auto-session = {
      enable = true;
      settings = {
        auto_save = true;
        auto_restore = true;
        auto_create = true;
        auto_restore_last_session = false;
      };
    };
  };
  programs.nixvim.extraConfigLua = ''
    vim.o.sessionoptions=
      "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  '';
}
