{
  inputs,
  pkgs,
  config,
  ...
}:
let
  nixvim' = inputs.nixvim.packages.${pkgs.system}.default;
  nvim = nixvim'.extend {
    config.theme = {
      colors = {
        inherit (config.lib.stylix.colors.withHashtag)
          base00
          base01
          base02
          base03
          base04
          base05
          base06
          base07
          base08
          base09
          base0A
          base0B
          base0C
          base0D
          base0E
          base0F
          ;
      };
      transparency = {
        main = false;
        signColumn = false;
      };
    };
    config.nixos-flake = "${config.var.configDirectory}/flake.nix";
  };
in
{
  home.packages = [
    nvim

    # language toolings
    pkgs.rustup
  ];
}
