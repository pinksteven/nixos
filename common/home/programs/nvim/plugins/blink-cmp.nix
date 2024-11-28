{ inputs, pkgs, ... }:
{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    package = inputs.blink-cmp.packages."${pkgs.system}".blink;
  };
}
