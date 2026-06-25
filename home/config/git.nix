# Git y GitHub CLI
{ ... }:

{
  programs.git = {
    enable = true;
    ignores = [ "*.swp" "*~" ".DS_Store" ];
    userName = "Cedrick-Coto";
    userEmail = "cedrick.coto@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      credential.helper = "gh";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "https";
  };
}
