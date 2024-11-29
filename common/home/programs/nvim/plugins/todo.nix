{
  programs.nixvim.plugins.todo-comments = {
    enable = true;

    keymaps = {
      todoTrouble.key = "<leader>xq";
      todoTelescope = {
        key = "<leader>ft";
        keywords = [
          "TODO"
          "FIX"
          "FIXME"
        ];
      };
    };
  };
}
