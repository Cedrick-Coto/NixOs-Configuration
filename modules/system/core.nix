# Core del sistema: boot, locale, usuarios, sudo, nix
{ pkgs, lib, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernel.sysctl."fs.inotify.max_user_watches" = 524288;

  time.timeZone = "America/Costa_Rica";
  i18n.defaultLocale = "es_MX.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  console.keyMap = "la-latin1";
  services.xserver.xkb.layout = "latam";

  users.users.cedrick = {
    isNormalUser = true;
    description = "cedrick";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
  };

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=15
    Defaults use_pty
  '';

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
