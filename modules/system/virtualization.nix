# Contenedores y virtualizacion
{ ... }:

{
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    virt-manager
    virt-viewer
    spice-gtk
    OVMF
  ];
}
