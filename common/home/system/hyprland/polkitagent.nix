{ inputs, pkgs, ... }: {
  home.packages =
    [ pkgs.lxqt.lxqt-policykit ];

  wayland.windowManager.hyprland.settings.exec-once =
    [ "lxqt-policykit-agent" ];
}