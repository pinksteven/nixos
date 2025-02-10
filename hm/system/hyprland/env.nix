{ pkgs, lib, ... }:
{
  home.file.".config/uwsm/env".text = ''
    export TERMINAL = ${lib.getExe pkgs.kitty}
    export NIXOS_OZONE_WL = 1

    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=Hyprland
    export XDG_SESSION_DESKTOP=Hyprland
    export MOZ_ENABLE_WAYLAND=1
    export ANKI_WAYLAND=1
    export DISABLE_QT5_COMPAT=0

    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORM=wayland
    export QT_QPA_PLATFORMTHEME=gtk3
    export QT_WAYLAND_DECORATION=adwaita
    export QT_QUICK_CONTROLS_STYLE=org.kde.desktop
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export ELECTRON_OZONE_PLATFORM_HINT=auto

    export WLR_DRM_NO_ATOMIC=1
    export WLR_BACKEND=vulkan
    export WLR_RENDERER=vulkan
    export SDL_VIDEODRIVER=wayland
    export CLUTTER_BACKEND=wayland
  '';
}
