# Aplicaciones de escritorio principales
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Productividad
    firefox
    obsidian
    onlyoffice-desktopeditors
    zathura

    # Archivos
    xfce.thunar
    kdePackages.ark
    peazip
    unzip
    unrar

    # Comunicacion
    vesktop

    # Editor alternativo
    vscodium
  ];
}
