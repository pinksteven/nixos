{pkgs, ... }:
let 
  fantasia = pkgs.callPackage ./fantasia.nix {};
in {
  home.packages = [ fantasia ];
}