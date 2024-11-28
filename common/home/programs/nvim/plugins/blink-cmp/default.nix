{ pkgs, ... }:

{
  nixpkgs.overlay = [
    (
      final: prev:
      let
        version = "0.6.2";
        src = prev.fetchFromGitHub {
          owner = "Saghen";
          repo = "blink.cmp";
          rev = "refs/tags/v0.6.2";
          hash = "sha256-uAIO8Q9jQvZ36Ngz9dURH7Jo7+WX/swauhj3ltIkZ5c=";
        };

      in
      {
        vimPlugins = prev.vimPlugins // {
          blink-cmp = prev.vimPlugins.blink-cmp.overrideAttrs (old: {
            inherit version src;
            blink-fuzzy-lib = prev.rustPlatform.buildRustPackage {
              inherit version src;
              pname = "blink-fuzzy-lib";
              env = {
                # TODO: remove this if plugin stops using nightly rust
                RUSTC_BOOTSTRAP = true;
              };
              useFetchCargoVendor = true;
              cargoHash = "sha256-XXI2jEoD6XbFNk3O8B6+aLzl1ZcJq1VinQXb+AOw8Rw=";
            };
          });
        };
      }
    )
  ];

  programs.nixvim.plugins.blink-cmp = {
    enabled = true;
    package = pkgs.vimPlugins.blink-cmp;
  };
}
