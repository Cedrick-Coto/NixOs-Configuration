# GTK theme, iconos, cursor
{ pkgs, config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    gt4.theme = null;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Nordic-cursors";
      package = pkgs.nordic;
      size = 24;
    };
  };
}
