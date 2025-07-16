{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.caelestia-shell.packages.${pkgs.system}.default
    inputs.caelestia-cli.packages.${pkgs.system}.default
  ];

  home.file.".config/caelestia/shell.json".text = # json
    ''
      {
        "background": {"enabled": false},
        "lock": {"enabled": false},
        "bar": {
          "sizes": {
            "innerHeight": 20,
            "windowPreviewSize": 350,
            "trayMenuWidth": 250,
            "batteryWidth": 250
          },
          "workspaces": {
            "showWindows": false,
            "label": "",
            "occupiedLabel": "󰮯",
            "activeLabel": "󰮯"
          }
        },
        "border": {
          "rounding": 25,
          "thickness": 10
        }
      }
    '';
}
