{ config, pkgs, ... }:
let
  converted = pkgs.runCommand "recolor" { } ''
    mkdir $out
    cd $out

    ${pkgs.gowal} convert ${config.stylix.image} \
    -t ${config.home.homeDirectory}/.config/stylix/gowal.json \
    -f png -o $out/wallpaper.png
  '';
in
{
  home.file.".config/stylix/gowal.json".text =
    with config.lib.stylix.colors.withHashtag; # json
    ''
      {
        "name": "Stylix",
        "colors": [
          "${base00}",
          "${base01}",
          "${base02}",
          "${base03}",
          "${base04}",
          "${base05}",
          "${base06}",
          "${base07}",
          "${base08}",
          "${base09}",
          "${base0A}",
          "${base0B}",
          "${base0C}",
          "${base0D}",
          "${base0E}",
          "${base0F}"
        ]
      }
    '';
  stylix.targets.hyprpaper.enable = false;
  services.hyprpaper = {
    enable = true;
    preload = [ "${converted}/wallpaper.png" ];
    wallpaper = [ ",${converted}/wallpaper.png" ];
  };
}
