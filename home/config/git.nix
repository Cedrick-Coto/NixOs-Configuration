# Git y GitHub CLI
{ ... }:

{
  programs.git = {
    enable = true;
    ignores = [ "*.swp" "*~" ".DS_Store" ];
    settings = {
      user.name = "Cedrick-Coto";
      user.email = "cedrick.coto@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      credential.helper = "libsecret";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "https";
  };
}
