# Red, firewall, tiempo
{ ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 5000 5001 ];
    logRefusedConnections = true;
  };

  services.timesyncd.enable = true;
}
