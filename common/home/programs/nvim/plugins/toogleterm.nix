{
  programs.nixvim.plugins.toggleterm = {
    enable = true;

    settings = {
      direction = "float";
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        desc = "Open Terminal";
      };
    }
  ];
}
