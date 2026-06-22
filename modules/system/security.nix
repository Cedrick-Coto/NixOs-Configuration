# Hardening del sistema (heredado de config anterior)
{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    nmap
    wireshark
    tcpdump
    lynis
    aide
    htop
    iotop
  ];

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.tcp_syncookies" = 1;
    "kernel.kptr_restrict" = 2;
    "kernel.dmesg_restrict" = 1;
    "kernel.yama.ptrace_scope" = 1;
    "fs.protected_hardlinks" = 1;
    "fs.protected_symlinks" = 1;
    "kernel.randomize_va_space" = 2;
  };

  boot.blacklistedKernelModules = [
    "cramfs" "freevxfs" "jffs2" "hfs" "hfsplus" "udf"
    "dccp" "sctp" "rds" "tipc"
  ];
}
