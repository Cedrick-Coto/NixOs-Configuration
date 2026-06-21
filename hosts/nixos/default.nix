{ config, pkgs, lib, ... }:

{
  imports = [
    # Hardware
    ./hardware.nix
    ../../modules/hardware/amd.nix
    ../../modules/hardware/bluetooth.nix

    # Sistema base
    ../../modules/system/core.nix
    ../../modules/system/network.nix
    ../../modules/system/security.nix
    ../../modules/system/virtualization.nix

    # Servicios
    ../../modules/services/sshd.nix
    ../../modules/services/flatpak.nix
    ../../modules/services/printing.nix

    # Desktop
    ../../modules/desktop/niri.nix
  ];

  nixpkgs.config.allowUnfree = true;
  networking.hostName = "nixos";
  system.stateVersion = "25.05";
}
