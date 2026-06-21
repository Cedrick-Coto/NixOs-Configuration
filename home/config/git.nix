# Git y GitHub CLI
{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Cedrick-Coto";
    userEmail = "cedrick.coto@gmail.com";
    ignores = [ "*.swp" "*~" ".DS_Store" ];
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      credential.helper = "store";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "https";
  };
}
