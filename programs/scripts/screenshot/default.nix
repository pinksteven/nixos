# - ## Screenshot
#-
#- This module provides a script to take screenshots using `grimblast` and `satty`.
#-
#- - `screenshot [region|window|monitor] [satty]` - Take a screenshot of the region, window, or monitor. Optionally, use `swappy` to copy the screenshot to the clipboard.
{ pkgs, ... }:
let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    folder="$HOME/Pictures/Screenshots"
    filename="$(date +%Y-%m-%d-%H:%M).png"

    if [[ $1 == "window" ]];then
      mode="window"
    elif [[ $1 == "region" ]];then
      mode="region"
    elif [[ $1 == "monitor" ]];then
      mode="output"
    fi

    if [[ $2 == "satty" ]];then
      ${pkgs.hyprshot}/bin/hyprshot -szm $mode --raw | ${pkgs.satty}/bin/satty --fullscreen -f - -o "$folder/$filename"
      exit 0
    fi

    ${pkgs.hyprshot}/bin/hyprshot -zm $mode -o $folder -f $filename

    
  '';
in {
  home.packages =
    [ pkgs.hyprshot pkgs.satty screenshot ];
}
