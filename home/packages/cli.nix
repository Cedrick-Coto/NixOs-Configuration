# Herramientas CLI y utilidades de terminal
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Sistema
    fastfetch
    baobab
    bat
    eza

    # Nerd Font para icons en la terminal
    nerd-fonts.jetbrains-mono

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

    # Zsh y plugins
    oh-my-zsh
    zsh-autosuggestions
    zsh-syntax-highlighting

    # Editor
    neovim
    ripgrep
    fd
    lazygit
    tree-sitter
    gcc

    # Herramientas de coding con IA
    opencode

  ];
}
