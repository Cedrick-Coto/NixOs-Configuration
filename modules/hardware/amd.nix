# AMD GPU + graficos
{ pkgs, ... }:

{
  boot.kernelParams = [
    "amdgpu.ppfeaturemask=0xffffffff"
    "amdgpu.dcfeaturemask=0x2"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "modesetting" ];
}
