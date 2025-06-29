{ pkgs, inputs, ... }:
{
  home.packages = [ inputs.caelestia-shell.packages.${pkgs.system}.default ];

  home.file.".config/caelestia/shell.json".text = # json
    ''
      {
      background: { enabled: false },
        lock: { enabled: false },
      bar: {
        workspaces: {
          label: "",
          occupiedLabel: "󰮯",
          activeLabel: "󰮯"
        }
      }
      }
    '';
}
