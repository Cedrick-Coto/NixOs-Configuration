# Herramientas creativas: diseno, video, audio
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    krita          # Diseno/dibujo
    shotcut        # Edicion de video
    kdePackages.kdenlive  # Edicion de video (alternativa)
  ];
}
