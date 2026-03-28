{ ... }:

{
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "latam"; # cámbialo si usas otro
    numlock_by_default = true;

    follow_mouse = 1;

    touchpad = {
      natural_scroll = true;
      tap-to-click = true;
    };

    accel_profile = "flat";
  };
}
