{ config, pkgs, ... }:

{
  programs.dconf.enable = true;

  systemd.user.services.dconf.wantedBy = [ "default.target" ];

  systemd.services.home-manager-cedrick.environment = {
    DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/${toString config.users.users.cedrick.uid}/bus";
  };

  programs.niri.enable = true;

  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableDynamicTheming = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/cedrick";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };
}
