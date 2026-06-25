# GTK theme, iconos, cursor
{ pkgs, config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
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
