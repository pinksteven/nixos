{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    # so the plugin is a fork and it didn't do shit with the flake file so the name is wrong
    plugins = [ inputs.hyprchroma.packages.${pkgs.system}.Hypr-DarkWindow ];
    settings.plugin.hyprchroma = {
      enabled = true;
      chromakey_background = "7,8,17";
    };
  };
}
