{ pkgs, ... }:
let
  loreforge = pkgs.callPackage ./loreforge.nix { };
in
{
  home.packages = [ loreforge ];
}
