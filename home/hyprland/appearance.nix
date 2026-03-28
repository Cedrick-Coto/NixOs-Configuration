{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
    	"opacity 0.9 0.9,class:^(kitty)$"
    ];
    decoration = {
      rounding = 12;

      blur = {
        enabled = true;
        size = 10;
        passes = 3;
	vibrancy = 0.2;
        new_optimizations = true;
        ignore_opacity = false;
      };

      shadow = {
        enabled = true;
        range = 20;
        render_power = 3;
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "easeOut,0.05,0.9,0.1,1.05"
        "easeInOut,0.65,0.05,0.36,1"
      ];

      animation = [
        "windows,1,4,easeOut"
        "windowsOut,1,4,easeInOut"
        "fade,1,3,easeOut"
        "workspaces,1,5,easeOut"
      ];
    };

  };
}
