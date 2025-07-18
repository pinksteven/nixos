{
  programs.yazi.keymap = {
    manager.prepend_keymap = [
      {
        on = "<C-q>";
        run = "quit";
        desc = "Quit Yazi";
      }
      {
        on = "<C-x>";
        run = "close";
        desc = "Close tab";
      }
      {
        on = "<C-n>";
        run = ''shell 'dragon -x -i -T "$1"' --confirm'';
        desc = "Drag and drop selected files";
      }
      {
        on = [
          "c"
          "m"
        ];
        run = "plugin chmod";
        desc = "Chmod files";
      }
      {
        on = [
          "g"
          "g"
        ];
        run = "plugin lazygit";
        desc = "lazygit";
      }
    ];
  };
}
