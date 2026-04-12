{ inputs, config, pkgs, ... }:

{
 imports = [
  inputs.noctalia.homeModules.default
  ./home/hyprland
  ];
 home.username = "cedrick";
 home.homeDirectory = "/home/cedrick";
 home.stateVersion = "25.11";
 
  home.packages = with pkgs; [
  grim
  isync
  mu
  unzip
  peazip
  unrar
  baobab
  nautilus
  steam
  slurp
  wl-clipboard
  swappy
  obsidian
  kdePackages.dolphin
  vim
  neovim
  kdePackages.ark
  emacs
  vesktop
  git
  wget
  curl
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
  git-credential-manager
  github-cli
  onlyoffice-desktopeditors
  protonup-qt
  protontricks
  uget
  persepolis
  motrix
  krita
  vscodium
  hydralauncher
  lutris
  (bottles.override { removeWarningPopup = true; })
  winetricks
  wineWowPackages.stable
  nwg-displays
  wlr-randr
  shotcut
  kdePackages.kdenlive
 ];
 services.udiskie = {
  enable = true;
  tray = "auto";
  automount = true;
  notify = true;
 };
 services.gpg-agent = {
  enable = true;
  # En Home Manager la opción es 'enableSshSupport' (con la 'h' minúscula)
  enableSshSupport = true; 
 };

programs.git = {
  enable = true;

  settings = {
    user = {
      name = "Cedrick-Coto";
      email = "cedrick.coto@gmail.com";
    };

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
    # configure options
    programs.noctalia-shell = {
      enable = true;
      settings = {
        # configure noctalia here
        bar = {
          density = "compact";
          position = "right";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Monochrome";
        general = {
          avatarImage = "/home/cedrick/.face";
          radiusRatio = 0.2;
        };
        location = {
          monthBeforeDay = true;
          name = "Marseille, France";
        };
      };
      # this may also be a string or a path to a JSON file.
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
xdg.portal = {
 enable = true;
 extraPortals = [
  pkgs.xdg-desktop-portal-cosmic
  pkgs.xdg-desktop-portal-gtk
 ];
 config.common.default = "cosmic";
};
}
