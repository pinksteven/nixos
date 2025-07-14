{ pkgs, ... }:
let
  dungeondraft = pkgs.callPackage ./dungeondraft.nix { };
in
{
  home.packages = [ dungeondraft ];
}
