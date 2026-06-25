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
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "https";
  };
}
