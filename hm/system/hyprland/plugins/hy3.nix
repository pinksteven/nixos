{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    # so the plugin is a fork and it didn't do shit with the flake file so the name is wrong
    plugins = [ inputs.hy3.packages.${pkgs.system}.hy3 ];
    settings.plugin.hy3 = {
      enabled = false;
    };
  };
}
