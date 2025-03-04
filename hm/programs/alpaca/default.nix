{ pkgs, ... }:
let
  alpaca = pkgs.alpaca.override {
    ollama = pkgs.ollama-rocm;
  };
in
{
  home.packages = [ alpaca ];
}
