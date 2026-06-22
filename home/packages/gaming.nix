# Juegos y herramientas de gaming
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Steam y gaming
    steam
    gamemode
    protonup-qt
    protontricks
    lutris
    hydralauncher

    # Wine/Bottles
    bottles
    winetricks
    # wineWow64Packages.stable  # compila horas desde source, comentado para builds rápidas
  ];
}
