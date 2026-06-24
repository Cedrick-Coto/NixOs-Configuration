{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      DisableAccounts = true;
    };

    profiles.default = {
      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.urlbar.behavior" = "float";
        "zen.theme.gradient.show" = true;
        "browser.startup.page" = 3;
      };

      search = {
        force = true;
        default = "ddg";
      };
    };
  };
}
