{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [
      # Apps
      "$mainMod, RETURN, exec, alacritty"
      "$mainMod, B, exec, firefox"
      "$mainMod, E, exec, dolphin"
      "$mainMod, RETURN, exec, kitty"
      
      "$mainMod CTRL, RETURN, exec, noctalia-shell ipc call launcher toggle"
      "$mainMod ALT, L, exec, noctalia-shell ipc call lockScreen lock"
      "$mainMod SHIFT, Q, exec, noctalia-shell ipc call sessionMenu toggle"

      # Close
      "$mainMod, Q, killactive"

      # Focus
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Move windows
      "$mainMod CTRL, H, movewindow, l"
      "$mainMod CTRL, L, movewindow, r"
      "$mainMod CTRL, K, movewindow, u"
      "$mainMod CTRL, J, movewindow, d"

      # Workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"

      # Move to workspace
      "$mainMod CTRL, 1, movetoworkspace, 1"
      "$mainMod CTRL, 2, movetoworkspace, 2"
      "$mainMod CTRL, 3, movetoworkspace, 3"
      "$mainMod CTRL, 4, movetoworkspace, 4"
      "$mainMod CTRL, 5, movetoworkspace, 5"
      "$mainMod CTRL, 6, movetoworkspace, 6"
      "$mainMod CTRL, 7, movetoworkspace, 7"
      "$mainMod CTRL, 8, movetoworkspace, 8"
      "$mainMod CTRL, 9, movetoworkspace, 9"
    ];

    bindl = [
      # Media
      ", XF86AudioRaiseVolume, exec, qs -c noctalia-shell ipc call volume increase"
      ", XF86AudioLowerVolume, exec, qs -c noctalia-shell ipc call volume decrease"
      ", XF86AudioMute, exec, qs -c noctalia-shell ipc call volume muteOutput"

      ", XF86MonBrightnessUp, exec, qs -c noctalia-shell ipc call brightness increase"
      ", XF86MonBrightnessDown, exec, qs -c noctalia-shell ipc call brightness decrease"
    ];
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
