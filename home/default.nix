{ inputs, config, pkgs, ... }:

{
  imports = [
    # Paquetes por categoria
    ./packages/default.nix
    ./packages/creative.nix
    ./packages/gaming.nix
    ./packages/cli.nix

    # Configuracion de usuario
    ./config/shell.nix
    ./config/git.nix
    ./config/lazygit.nix
    ./config/gtk.nix
    ./config/zen.nix
    ./config/niri.nix
    ./config/nvim.nix

    # Servicios de usuario
    ./services.nix
  ];

  home.username = "cedrick";
  home.homeDirectory = "/home/cedrick";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
