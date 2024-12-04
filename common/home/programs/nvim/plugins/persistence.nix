{
  programs.nixvim.plugins.persistence = {
    enable = true;
    options = [
      "buffers"
      "curdir"
      "folds"
      "options"
      "skiprtp"
      "tabpages"
      "winsize"
    ];
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>qs";
      action.__raw = ''
        function()
          require("persistence").load()
        end
      '';
      options = {
        desc = "Load last session for this dir";
      };
    }
    {
      mode = "n";
      key = "<leader>qS";
      action.__raw = ''
        function()
          require("persistence").select()
        end
      '';
      options = {
        desc = "Select session to load";
      };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action.__raw = ''
        function()
          require("persistence").load({last = true})
        end
      '';
      options = {
        desc = "Load last session";
      };
    }
  ];
}
