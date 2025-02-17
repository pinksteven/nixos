# - ## Hyprpanel
#-
#- Quick scripts to toggle, reload and kill hyprpanel.
#-
#- - `hyprpanel-toggle` - Toggle hyprpanel.
#- - `hyprpanel-reload` - Reload hyprpanel.
#- - `hyprpanel-kill` - Kill hyprpanel.
{ pkgs, ... }:
let
  hyprpanel-toggle = pkgs.writeShellScriptBin "hyprpanel-toggle" ''
    hyprpanel t bar-0
    hyprpanel t bar-1
    hyprpanel t bar-2
    hyprpanel t bar-3
  '';

  hyprpanel-hide = pkgs.writeShellScriptBin "hyprpanel-hide" ''
    status=$(hyprpanel iwv bar-0)
    if [[ $status == "true" ]]; then
      hyprpanel t bar-0
    fi
    status=$(hyprpanel iwv bar-1)
    if [[ $status == "true" ]]; then
      hyprpanel t bar-1
    fi
    status=$(hyprpanel iwv bar-2)
    if [[ $status == "true" ]]; then
      hyprpanel t bar-2
    fi
  '';

  hyprpanel-show = pkgs.writeShellScriptBin "hyprpanel-show" ''
    status=$(hyprpanel iwv bar-0)
    if [[ $status == "false" ]]; then
      hyprpanel t bar-0
    fi
    status=$(hyprpanel iwv bar-1)
    if [[ $status == "false" ]]; then
      hyprpanel t bar-1
    fi
    status=$(hyprpanel iwv bar-2)
    if [[ $status == "false" ]]; then
      hyprpanel t bar-2
    fi
  '';
in
{
  home.packages = [
    hyprpanel-toggle
    hyprpanel-hide
    hyprpanel-show
  ];
}
