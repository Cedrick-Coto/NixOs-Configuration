# Shell: bash, starship, fzf, zoxide, aliases
{ pkgs, ... }:

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
      eval "$(starship init bash)"
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      line_break.disabled = false;
    };
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
