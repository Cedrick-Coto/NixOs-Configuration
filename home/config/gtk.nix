# GTK theme, iconos, cursor
{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-lavender-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "lavender";
        flavor = "mocha";
      };
    };
    cursorTheme = {
      name = "Afterglow-Cursors";
      package = pkgs.afterglow-cursors-recolored;
      size = 24;
    };
  };
}
