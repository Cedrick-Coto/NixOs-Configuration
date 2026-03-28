{ ... }:

{
  wayland.windowManager.hyprland.enable = true;

  imports = [
    ./input.nix
    ./binds.nix
    ./monitor.nix
    ./env.nix
    ./general.nix
    ./misc.nix
    ./autostart.nix
    ./appearance.nix
  ];
}
