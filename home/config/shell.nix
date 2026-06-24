# Shell: bash, zsh, fzf, zoxide, aliases
{ pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls   = "eza --icons";
      ll   = "eza -la --icons";
      la   = "eza -la --icons";
      cat  = "bat";
      top  = "btop";
      nrs  = "sudo nixos-rebuild switch --flake $FLAKE#nixos";
      hms  = "home-manager switch --flake $FLAKE#cedrick";
      nv   = "nvim";
    };
    initExtra = ''
      export FLAKE="$HOME/NixOs-Configuration"
      eval "$(zoxide init bash)"
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls   = "eza --icons";
      ll   = "eza -la --icons";
      la   = "eza -la --icons";
      cat  = "bat";
      top  = "btop";
      nrs  = "sudo nixos-rebuild switch --flake $FLAKE#nixos";
      hms  = "home-manager switch --flake $FLAKE#cedrick";
      nv   = "nvim";
    };
    initContent = lib.mkBefore ''
      export ZSH="${pkgs.oh-my-zsh}/share/oh-my-zsh"
      export ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
      export FLAKE="$HOME/NixOs-Configuration"
      export PATH="$HOME/.local/bin:$PATH"
      eval "$(zoxide init zsh)"
    '';
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "sudo"
        "web-search"
        "pip"
        "systemd"
      ];
      # custom managed imperatively at "$HOME/.oh-my-zsh/custom"
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };
}
