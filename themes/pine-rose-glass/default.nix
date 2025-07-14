{
  imports = [
    ../../system/variables-config.nix
    ./stylix.nix
  ];

  config.var.theme = import ./variables.nix;
}
