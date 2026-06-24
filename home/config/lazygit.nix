# Git y github cli
{ ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          lightTheme = false;
          activeBorderColor = [ "cyan" "bold" ];
          inactiveBorderColor = [ "white" ];
        };
      };
    };
  };
}
