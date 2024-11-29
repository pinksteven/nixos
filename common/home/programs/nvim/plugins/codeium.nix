{
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins = {
    codeium-nvim = {
      enable = true;

      settings = {
        enable_chat = true;

        tools = {
          curl = lib.getExe pkgs.curl;
          gzip = lib.getExe pkgs.gzip;
          uname = lib.getExe' pkgs.coreutils "uname";
          uuidgen = lib.getExe' pkgs.util-linux "uuidgen";
        };
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>uc";
      action = "<cmd>Codeium Chat<CR>";
      options = {
        desc = "Codeium Chat";
      };
    }
  ];
}
