{ config, pkgs, lib, ... }:

{
  # ============================================================================
  # security.nix — Hardening completo de NixOS
  # ============================================================================
  # 
  # Este módulo implementa hardening de seguridad para NixOS siguiendo:
  # - CIS Benchmarks for Linux
  # - NIST Cybersecurity Framework
  # - Best practices de la comunidad NixOS
  #
  # IMPORTANTE: Esta configuración está diseñada para un sistema LOCAL/DESKTOP,
  # NO para un servidor expuesto a internet. Si vas a exponer servicios públicos,
  # considera agregar:
  # - VPN (WireGuard) para acceso remoto
  # - Fail2ban más agresivo
  # - IDS/IPS (Snort, Suricata)
  # - Rate limiting más estricto
  #
  # Autor: Cedrick Coto
  # Fecha: 2026-05-22
  # Repo: https://github.com/Cedrick-Coto/NixOs-Configuration
  #
  # ============================================================================

  # ----------------------------------------------------------------------------
  # 1. FIREWALL — Configuración de firewall con nftables
  # ----------------------------------------------------------------------------
  
  networking.firewall = {
    enable = true;
    
    # Permitir solo puertos específicos (principio de mínimo privilegio)
    allowedTCPPorts = [
      # 22    # SSH (comentado por seguridad, usar allowedTCPPortRanges si necesitas)
      # 80    # HTTP (solo si tienes servidor web)
      # 443   # HTTPS (solo si tienes servidor web)
    ];
    
    allowedUDPPorts = [
      # Agregar puertos UDP necesarios aquí
    ];
    
    # Logging de paquetes rechazados (útil para análisis)
    logRefusedConnections = true;
    logRefusedPackets = true;
    logRefusedUnicastsOnly = true;
    
    # Reglas extra de nftables (avanzado)
    extraCommands = ''
      # Bloquear pings (ICMP echo requests) desde internet
      # Descomenta si quieres ser "invisible" a ping scans
      # iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
      
      # Rate limiting para SSH (prevenir brute-force)
      iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
      iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
    '';
  };

  # ----------------------------------------------------------------------------
  # 2. SSH — Hardening de OpenSSH
  # ----------------------------------------------------------------------------
  
  services.openssh = {
    enable = true;
    
    settings = {
      # Deshabilitar login de root por SSH (crítico)
      PermitRootLogin = "no";
      
      # Deshabilitar autenticación por password (solo SSH keys)
      PasswordAuthentication = false;
      ChallengeResponseAuthentication = false;
      
      # Deshabilitar X11 forwarding (no necesario, reduce superficie de ataque)
      X11Forwarding = false;
      
      # Usar solo protocolo SSH 2 (SSH 1 es inseguro)
      Protocol = 2;
      
      # Timeout de sesiones inactivas (15 minutos)
      ClientAliveInterval = 300;
      ClientAliveCountMax = 2;
      
      # Limitar usuarios que pueden hacer SSH
      # AllowUsers = [ "cedrick" ];  # Descomenta y ajusta según necesites
      
      # Usar solo algoritmos criptográficos fuertes
      KexAlgorithms = [
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group-exchange-sha256"
      ];
      
      Ciphers = [
        "chacha20-poly1305@openssh.com"
        "aes256-gcm@openssh.com"
        "aes128-gcm@openssh.com"
        "aes256-ctr"
        "aes192-ctr"
        "aes128-ctr"
      ];
      
      MACs = [
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "hmac-sha2-512"
        "hmac-sha2-256"
      ];
    };
  };

  # ----------------------------------------------------------------------------
  # 3. FAIL2BAN — Protección contra brute-force
  # ----------------------------------------------------------------------------
  
  services.fail2ban = {
    enable = true;
    
    # Configuración de jails (prisiones para IPs maliciosas)
    jails = {
      # Jail para SSH
      sshd = ''
        enabled = true
        port = ssh
        filter = sshd
        logpath = /var/log/auth.log
        maxretry = 3
        findtime = 600
        bantime = 3600
      '';
      
      # Jail para HTTP (si tienes servidor web)
      # nginx-http-auth = ''
      #   enabled = true
      #   port = http,https
      #   logpath = /var/log/nginx/error.log
      # '';
    };
    
    # Configuración global
    maxretry = 3;      # Intentos fallidos antes de ban
    findtime = "10m";  # Ventana de tiempo para contar intentos
    bantime = "1h";    # Duración del ban
  };

  # ----------------------------------------------------------------------------
  # 4. KERNEL HARDENING — Parámetros de seguridad del kernel
  # ----------------------------------------------------------------------------
  
  boot.kernel.sysctl = {
    # Protección contra IP spoofing
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    
    # Ignorar ICMP redirects (prevenir MITM)
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    
    # No enviar ICMP redirects (no somos router)
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    
    # Ignorar pings broadcast (prevenir Smurf attack)
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    
    # Ignorar bogus ICMP error responses
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    
    # Protección contra SYN flood attacks
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_syn_retries" = 2;
    "net.ipv4.tcp_synack_retries" = 2;
    "net.ipv4.tcp_max_syn_backlog" = 4096;
    
    # Log packets con direcciones imposibles (martian packets)
    "net.ipv4.conf.all.log_martians" = 1;
    "net.ipv4.conf.default.log_martians" = 1;
    
    # Deshabilitar source routing (prevenir ataques de routing)
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.default.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.default.accept_source_route" = 0;
    
    # Protección de memoria
    "kernel.kptr_restrict" = 2;              # Ocultar kernel pointers (prevenir exploits)
    "kernel.dmesg_restrict" = 1;             # Restringir acceso a dmesg
    "kernel.yama.ptrace_scope" = 1;          # Restringir ptrace (debugging)
    
    # Protección contra hardlinks y symlinks maliciosos
    "fs.protected_hardlinks" = 1;
    "fs.protected_symlinks" = 1;
    "fs.protected_fifos" = 2;
    "fs.protected_regular" = 2;
    
    # Randomización de espacio de direcciones (ASLR)
    "kernel.randomize_va_space" = 2;
    
    # Deshabilitar core dumps (pueden contener información sensible)
    "kernel.core_uses_pid" = 1;
    "fs.suid_dumpable" = 0;
    
    # Limitar acceso a logs del kernel
    "kernel.printk" = "3 3 3 3";
  };
  
  # Parámetros adicionales del kernel en boot
  boot.kernelParams = [
    # IOMMU params - COMMENTED OUT by default
    # WARNING: These can break HDMI/display output on some AMD systems
    # Test one by one if you need DMA protection
    # See Reddit feedback: https://www.reddit.com/r/NixOS/comments/...
    # "iommu=force"
    # "intel_iommu=on"  # Para Intel
    # "amd_iommu=on"    # Para AMD
    
    # Deshabilitar módulos no firmados
    # "module.sig_enforce=1"  # Descomenta si quieres máxima seguridad
  ];

  # ----------------------------------------------------------------------------
  # 5. AUDITD — Auditoría del sistema
  # ----------------------------------------------------------------------------
  
  security.auditd.enable = true;
  security.audit = {
    enable = true;
    
    # Reglas de auditoría
    rules = [
      # Auditar cambios en archivos críticos del sistema
      "-w /etc/passwd -p wa -k identity"
      "-w /etc/group -p wa -k identity"
      "-w /etc/shadow -p wa -k identity"
      "-w /etc/sudoers -p wa -k sudoers"
      "-w /etc/ssh/sshd_config -p wa -k sshd"
      
      # Auditar cambios en configuración de red
      "-w /etc/network/ -p wa -k network"
      "-w /etc/hosts -p wa -k network"
      "-w /etc/hostname -p wa -k network"
      
      # Auditar cambios en bootloader
      "-w /boot/ -p wa -k boot"
      "-w /etc/nixos/ -p wa -k nixos-config"
      
      # Auditar uso de comandos privilegiados
      "-a always,exit -F arch=b64 -S execve -F euid=0 -k root-commands"
      
      # Auditar intentos de cambio de permisos
      "-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat -k perm-mod"
      "-a always,exit -F arch=b64 -S chown,fchown,fchownat,lchown -k perm-mod"
      
      # Auditar montaje de filesystems
      "-a always,exit -F arch=b64 -S mount,umount2 -k mount"
      
      # Auditar eliminación de archivos
      "-a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -k delete"
    ];
  };

  # ----------------------------------------------------------------------------
  # 6. APPARMOR — Mandatory Access Control
  # ----------------------------------------------------------------------------
  
  security.apparmor = {
    enable = true;
    
    # Habilitar perfiles de AppArmor para aplicaciones
    packages = [ pkgs.apparmor-profiles ];
    
    # Modo de operación: enforce (bloquear) o complain (solo log)
    # Empieza con complain para no romper nada, luego cambia a enforce
    # killUnconfinedConfinables = true;  # Descomenta para enforce mode
  };

  # ----------------------------------------------------------------------------
  # 7. AUTOMATIC SECURITY UPDATES
  # ----------------------------------------------------------------------------
  
  system.autoUpgrade = {
    enable = true;
    
    # Actualizar automáticamente (con cuidado en producción)
    # allowReboot = false;  # No reiniciar automáticamente
    
    # Fecha y hora de actualizaciones
    dates = "weekly";  # Opciones: daily, weekly, monthly
    
    # Flake a usar para actualizaciones
    flake = "github:Cedrick-Coto/NixOs-Configuration";
  };

  # ----------------------------------------------------------------------------
  # 8. FILE INTEGRITY MONITORING — AIDE
  # ----------------------------------------------------------------------------
  
  # AIDE (Advanced Intrusion Detection Environment)
  # Detecta cambios no autorizados en archivos del sistema
  
  environment.systemPackages = with pkgs; [
    aide  # Instalar AIDE
  ];
  
  # Configuración de AIDE (crear /etc/aide.conf manualmente)
  # Comandos útiles:
  # - aide --init          # Crear base de datos inicial
  # - aide --check         # Verificar integridad
  # - aide --update        # Actualizar base de datos

  # ----------------------------------------------------------------------------
  # 9. UMASK — Permisos por defecto de archivos
  # ----------------------------------------------------------------------------
  
  # Umask más restrictivo (archivos: 640, directorios: 750)
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "-";
      item = "umask";
      value = "027";
    }
  ];

  # ----------------------------------------------------------------------------
  # 10. SUDO — Configuración segura de sudo
  # ----------------------------------------------------------------------------
  
  security.sudo = {
    enable = true;
    
    # Requerir password para sudo (no NOPASSWD)
    wheelNeedsPassword = true;
    
    # Timeout de sudo (minutos)
    extraConfig = ''
      Defaults timestamp_timeout=15
      Defaults use_pty
      Defaults logfile=/var/log/sudo.log
      Defaults log_input, log_output
    '';
  };

  # ----------------------------------------------------------------------------
  # 11. DESHABILITAR SERVICIOS INNECESARIOS
  # ----------------------------------------------------------------------------
  
  # Deshabilitar servicios que no necesitas (reduce superficie de ataque)
  services = {
    # Deshabilitar Avahi (mDNS/DNS-SD) si no lo usas
    avahi.enable = lib.mkDefault false;
    
    # Deshabilitar CUPS (impresión) si no lo usas
    # printing.enable = lib.mkDefault false;
    
    # Deshabilitar Bluetooth si no lo usas
    # bluetooth.enable = lib.mkDefault false;
  };

  # ----------------------------------------------------------------------------
  # 12. LOGGING — Configuración de logs
  # ----------------------------------------------------------------------------
  
  # Rsyslog para logging centralizado
  services.rsyslogd = {
    enable = true;
    
    # Configuración extra de rsyslog
    extraConfig = ''
      # Log todo a archivos separados por facilidad
      auth,authpriv.*                 /var/log/auth.log
      *.*;auth,authpriv.none          /var/log/syslog
      kern.*                          /var/log/kern.log
      
      # Rotar logs automáticamente
      $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
    '';
  };
  
  # Logrotate para gestión de logs
  services.logrotate = {
    enable = true;
    
    settings = {
      # Configuración global
      global = {
        rotate = 7;        # Mantener 7 días de logs
        daily = true;      # Rotar diariamente
        compress = true;   # Comprimir logs antiguos
        delaycompress = true;
        missingok = true;
        notifempty = true;
      };
      
      # Logs específicos
      "/var/log/auth.log" = {
        rotate = 30;  # Mantener logs de autenticación por 30 días
      };
      
      "/var/log/sudo.log" = {
        rotate = 30;
      };
    };
  };

  # ----------------------------------------------------------------------------
  # 13. RESTRICCIONES DE USUARIOS
  # ----------------------------------------------------------------------------
  
  # Limitar recursos por usuario (prevenir DoS local)
  security.pam.loginLimits = [
    # Limitar procesos por usuario
    {
      domain = "*";
      type = "hard";
      item = "nproc";
      value = "1000";
    }
    
    # Limitar archivos abiertos
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "4096";
    }
    
    # Limitar memoria
    {
      domain = "*";
      type = "hard";
      item = "as";
      value = "unlimited";  # Ajustar según necesidad
    }
  ];

  # ----------------------------------------------------------------------------
  # 14. DESHABILITAR MÓDULOS DEL KERNEL INNECESARIOS
  # ----------------------------------------------------------------------------
  
  boot.blacklistedKernelModules = [
    # Deshabilitar filesystems raros (reduce superficie de ataque)
    "cramfs"
    "freevxfs"
    "jffs2"
    "hfs"
    "hfsplus"
    "udf"
    
    # Deshabilitar protocolos de red raros
    "dccp"
    "sctp"
    "rds"
    "tipc"
    
    # Deshabilitar USB storage si no lo necesitas (prevenir BadUSB)
    # "usb-storage"  # Descomenta si no usas USBs
  ];

  # ----------------------------------------------------------------------------
  # 15. HERRAMIENTAS DE SEGURIDAD
  # ----------------------------------------------------------------------------
  
  environment.systemPackages = with pkgs; [
    # Análisis de red
    nmap              # Network scanner
    wireshark         # Packet analyzer
    tcpdump           # Packet capture
    
    # Análisis de sistema
    lynis             # Security auditing tool
    chkrootkit        # Rootkit detector
    rkhunter          # Rootkit hunter
    
    # Hardening
    aide              # File integrity monitoring
    
    # Forensics
    sleuthkit         # Forensic toolkit
    
    # Monitoring
    htop              # Process viewer
    iotop             # I/O monitor
    nethogs           # Network monitor per process
  ];

  # ----------------------------------------------------------------------------
  # 16. CONFIGURACIÓN DE TIEMPO (NTP)
  # ----------------------------------------------------------------------------
  
  # Sincronización de tiempo (crítico para logs y autenticación)
  services.timesyncd = {
    enable = true;
    
    # Servidores NTP confiables
    servers = [
      "0.nixos.pool.ntp.org"
      "1.nixos.pool.ntp.org"
      "2.nixos.pool.ntp.org"
      "3.nixos.pool.ntp.org"
    ];
  };

  # ----------------------------------------------------------------------------
  # 17. DESHABILITAR CORE DUMPS
  # ----------------------------------------------------------------------------
  
  # Core dumps pueden contener información sensible (passwords, keys)
  systemd.coredump.enable = false;
  
  # Límite de core dump a 0
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "hard";
      item = "core";
      value = "0";
    }
  ];

  # ----------------------------------------------------------------------------
  # 18. SECURE BOOT (Opcional, avanzado)
  # ----------------------------------------------------------------------------
  
  # Secure Boot requiere configuración adicional
  # Ver: https://nixos.wiki/wiki/Secure_Boot
  
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.lanzaboote = {
  #   enable = true;
  #   pkiBundle = "/etc/secureboot";
  # };

  # ----------------------------------------------------------------------------
  # 19. MONITOREO Y ALERTAS
  # ----------------------------------------------------------------------------
  
  # Configurar alertas por email cuando hay eventos críticos
  # Requiere configurar un MTA (Mail Transfer Agent)
  
  # services.postfix = {
  #   enable = true;
  #   # Configuración de postfix aquí
  # };

  # ----------------------------------------------------------------------------
  # 20. NOTAS Y PRÓXIMOS PASOS
  # ----------------------------------------------------------------------------
  
  # TODO: Implementar después de práctica inicial
  # - [ ] Configurar SIEM (Wazuh) para centralizar logs
  # - [ ] Implementar IDS/IPS (Snort/Suricata)
  # - [ ] Configurar VPN (WireGuard) para acceso remoto seguro
  # - [ ] Implementar 2FA para SSH (Google Authenticator)
  # - [ ] Configurar backup automático encriptado
  # - [ ] Implementar honeypot para detectar ataques
  # - [ ] Configurar SELinux (alternativa a AppArmor, más complejo)
  
  # RECURSOS:
  # - CIS Benchmarks: https://www.cisecurity.org/cis-benchmarks/
  # - NixOS Security: https://nixos.wiki/wiki/Security
  # - NIST Framework: https://www.nist.gov/cyberframework
  # - Lynis (auditoría): sudo lynis audit system
  
  # COMANDOS ÚTILES:
  # - Ver logs de firewall: journalctl -u firewall
  # - Ver intentos de SSH: journalctl -u sshd | grep Failed
  # - Ver bans de fail2ban: fail2ban-client status sshd
  # - Auditar sistema: sudo lynis audit system
  # - Ver reglas de audit: auditctl -l
  # - Ver logs de audit: ausearch -k <key>
  
}
