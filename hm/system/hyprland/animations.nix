{ config, ... }:
let
  animationSpeed = config.var.theme.animation-speed;
in
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      bezier = [
        "linear, 0, 0, 1, 1"
        "md3_standard, 0.2, 0, 0, 1"
        "md3_decel, 0.05, 0.7, 0.1, 1"
        "md3_accel, 0.3, 0, 0.8, 0.15"
        "overshot, 0.05, 0.9, 0.1, 1.1"
        "crazyshot, 0.1, 1.5, 0.76, 0.92"
        "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
        "menu_decel, 0.1, 1, 0, 1"
        "menu_accel, 0.38, 0.04, 1, 0.07"
        "easeInOutCirc, 0.85, 0, 0.15, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutExpo, 0.16, 1, 0.3, 1"
        "softAcDecel, 0.26, 0.26, 0.15, 1"
        "md2, 0.4, 0, 0.2, 1"
      ];

      animation = [
        "windows, 1, ${toString animationSpeed}, md3_decel, popin 60%"
        "windowsIn, 1, ${toString animationSpeed}, md3_decel, popin 60%"
        "windowsOut, 1, ${toString animationSpeed}, md3_accel, popin 60%"
        "border, 1, ${toString (animationSpeed * 2)}, default"
        "fade, 1, ${toString animationSpeed}, md3_decel"
        "layersIn, 1, ${toString animationSpeed}, menu_decel, slide top"
        "layersOut, 1, ${toString animationSpeed}, menu_accel, slide top"
        "fadeLayersIn, 1, ${toString (animationSpeed * 2)}, linear"
        "fadeLayersOut, 1, ${toString (animationSpeed * 2)}, linear"
        "workspaces, 1, ${toString animationSpeed}, menu_decel, slide"
        "specialWorkspace, 1, ${toString animationSpeed}, md3_decel, slidevert"
      ];
    };
  };
}
