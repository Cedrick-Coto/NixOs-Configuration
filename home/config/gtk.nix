# GTK theme, iconos, cursor
{ pkgs, config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    gtk4.theme = config.gtk.theme.name;
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
