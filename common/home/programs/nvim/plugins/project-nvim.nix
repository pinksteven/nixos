{
  programs.nixvim.plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope projects<CR>";
      options = {
        desc = "Find projects";
      };
    }
  ];
}
