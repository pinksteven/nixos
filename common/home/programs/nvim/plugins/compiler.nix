{
  programs.nixvim.plugins = {
    compiler.enable = true;

    which-key.settings.spec = [
      {
        __unkeyed = "<leader>R";
        group = "Compiler";
        icon = "";
      }
    ];
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>Ro";
      action = "<cmd>CompilerOpen<CR>";
      options = {
        desc = "Compiler Open";
      };
    }
    {
      mode = "n";
      key = "<leader>Rr";
      action = "<cmd>CompilerRedo<CR>";
      options = {
        desc = "Compiler Redo";
      };
    }
    {
      mode = "n";
      key = "<leader>Rs";
      action = "<cmd>CompilerStop<CR>";
      options = {
        desc = "Compiler Stop";
      };
    }
    {
      mode = "n";
      key = "<leader>Rt";
      action = "<cmd>CompilerToggleResults<CR>";
      options = {
        desc = "Compiler Toggle Results";
      };
    }
  ];
}
