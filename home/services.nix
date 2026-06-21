# Servicios de usuario (systemd --user)
{ ... }:

{
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };
}
