{ ... }:

{
  wayland.windowManager.hyprland.settings.env = [
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "QT_QPA_PLATFORM,wayland"
    "QT_QPA_PLATFORMTHEME,gtk3"
    "ELECTRON_OZONE_PLATFORM_HINT,auto"
  ];
}