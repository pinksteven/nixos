{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.ignis.packages."${pkgs.system}".ignis
  ];
}
