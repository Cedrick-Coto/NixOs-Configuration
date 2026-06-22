# Herramientas CLI y utilidades de terminal
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Sistema
    fastfetch
    baobab

    # Captura de pantalla
    grim
    slurp
    swappy
    wl-clipboard

    # Monitores
    nwg-displays
    wlr-randr

    # Audio
    pavucontrol
    pamixer
    brightnessctl

    # Notificaciones
    libnotify
  ];
}
