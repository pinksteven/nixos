{ inputs, pkgs, ... }:
{
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "blink.compat";
      src = inputs.blink-compat;
      version = inputs.blink-compat.shortRev;
    })
  ];

  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    package = inputs.blink-cmp.packages."${pkgs.system}".blink-cmp;
  };
}
