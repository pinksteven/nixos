{
  home.sessionVariables = {
    TERMINAL = "kitty";
    NIXOS_OZONE_WL = "1";
  };

  wayland.windowManager.hyprland.settings.env = [
    "XDG_SESSION_TYPE,wayland"
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "MOZ_ENABLE_WAYLAND,1"
    "ANKI_WAYLAND,1"
    "DISABLE_QT5_COMPAT,0"

    "QT_AUTO_SCREEN_SCALE_FACTOR,1"
    "QT_QPA_PLATFORM,wayland"
    "QT_QPA_PLATFORMTHEME,gtk3"
    "QT_WAYLAND_DECORATION,adwaita"
    "QT_QUICK_CONTROLS_STYLE,org.kde.desktop"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    "ELECTRON_OZONE_PLATFORM_HINT,auto"

    "WLR_DRM_NO_ATOMIC,1"
    "WLR_BACKEND,vulkan"
    "WLR_RENDERER,vulkan"
    "SDL_VIDEODRIVER,wayland"
    "CLUTTER_BACKEND,wayland"
  ];
}
