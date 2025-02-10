{
  programs.yazi.keymap.manager.prepend_keymap = [
    {
      on = [
        "T"
        "m"
      ];
      run = "plugin --sync max-preview";
      desc = "Maximize preview";
    }
    {
      on = [
        "T"
        "h"
      ];
      run = "plugin --sync hide-preview";
      desc = "Hide preview";
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
    {
      on = [ "C" ];
      run = "plugin ouch --args=zip";
      desc = "Compress files";
    }
  ];
}
