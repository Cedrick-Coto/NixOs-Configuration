{ config, pkgs, ... }:
let
  programsDir = ./config/programs;
  files = builtins.readDir programsDir;

  validDirs = builtins.filter
    (name:
      files.${name} == "directory" &&
      builtins.pathExists (programsDir + "/${name}/default.nix")
    )
    (builtins.attrNames files);

  programImports = map (name: programsDir + "/${name}") validDirs;

in
{
  imports =
    [
      ./config/sessions/hyprland/default.nix
    ] ++ programImports;

 home.username = "cedrick";
 home.homeDirectory = "/home/cedrick";
 home.stateVersion = "25.11";
 
  home.packages = with pkgs; [
  obsidian
  vim
  emacs
  git
  wget
  curl
  mission-center
  (btop.override { rocmSupport = true; })
  neofetch
  ripgrep
  fzf
  bat
  eza
  zoxide
  nodejs_22
  python3
  firefox
  kdePackages.kdenlive
  git-credential-manager
  github-cli
  onlyoffice-desktopeditors
 ];

 services.gpg-agent = {
  enable = true;
  # En Home Manager la opción es 'enableSshSupport' (con la 'h' minúscula)
  enableSshSupport = true; 
 };

 programs.git = {
  enable = true;
  userName = "Cedrick-Coto";
  userEmail = "cedrick.coto@gmail.com";
  extraConfig = {
    credential.helper = "store";
    init.defaultBranch = "main";
    pull.rebase = true;
  };
 };

 home.pointerCursor = {
  gtk.enable = true;
  package = pkgs.catppuccin-cursors.mochaDark;
  name = "catppuccin-mocha-dark-cursors";
  size = 24;
 };

 gtk = {
  enable = true;
  theme = {
    name = "catppuccin-mocha-lavender-standard"; # Puedes cambiar lavender por blue, flamingo, etc.
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
 }; 

 programs.bash = {
  enable = true;
  shellAliases = {
   ls = "eza --icons";
   ll = "eza -la --icons";
   cat = "bat";
   nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
   hms = "home-manager switch --flake ~/nixos-config#cedrick";
  };
  initExtra = ''
   eval "$(zoxide init bash)"
  '';
 };
  programs.home-manager.enable = true;
}
