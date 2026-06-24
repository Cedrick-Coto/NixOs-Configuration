# Aplicaciones de escritorio principales
{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Basicos
    kitty

    # Productividad
    obsidian
    onlyoffice-desktopeditors
    zathura
    # Gnome Software para descubrir/instalar Flatpaks (funciona en cualquier escritorio)
    gnome-software

    # Archivos
    thunar
    kdePackages.ark
    peazip
    unzip
    unrar

    # Gestion imperativa de paquetes (flatpak/appimage)
    gearlever
    appimage-run

    # Comunicacion
    vesktop

    # Editor alternativo
    vscodium
  ];
}
