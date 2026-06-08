# NixOS Configuration — Cedrick Coto

**Sistema operativo:** NixOS 25.11  
**Entorno de escritorio:** Hyprland + Noctalia Shell  
**Gestión de configuración:** Flakes + Home Manager  
**Repo:** https://github.com/Cedrick-Coto/NixOs-Configuration

---

## 📖 Sobre Este Repo

Este es mi configuración personal de NixOS, desarrollada desde cero en marzo de 2026. Empecé con una instalación mínima (CLI) y en **2 semanas** tenía un sistema completamente funcional que compartí en Reddit y recibí felicitaciones.

**¿Por qué NixOS?**

Tras perder un ensayo importante por trastear con mi sistema anterior (CachyOS), decidí migrar a NixOS por su naturaleza declarativa y reproducible. Si algo se rompe, simplemente hago `git checkout` + `nixos-rebuild switch` y vuelvo a un estado conocido. Incluso puedo seleccionar generaciones anteriores desde el menú de arranque.

**Filosofía:** Todo como código, versionado con Git, reproducible en cualquier máquina.

---

## 🚀 Instalación Rápida

### En una instalación nueva de NixOS:

```bash
# 1. Clonar el repo
git clone https://github.com/Cedrick-Coto/NixOs-Configuration.git ~/NixOs-Configuration
cd ~/NixOs-Configuration

# 2. Generar hardware-configuration.nix para tu máquina
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix

# 3. Aplicar la configuración
sudo nixos-rebuild switch --flake .#nixos

# 4. Reiniciar
reboot
```

**Nota:** El `hardware-configuration.nix` es específico de cada máquina (UUIDs de discos, hardware detectado). Por eso está en `.gitignore` y debes generarlo en cada instalación nueva.

---

## 📁 Estructura del Repo

```
NixOs-Configuration/
├── flake.nix                    # Flake principal con inputs y outputs
├── flake.lock                   # Versiones locked de dependencias
├── configuration.nix            # Configuración del sistema
├── security.nix                 # Módulo de hardening (NEW!)
├── home.nix                     # Home Manager config
├── hardware-configuration.nix   # Hardware-specific (gitignored)
├── .gitignore                   # Excluye hardware-configuration.nix
├── README.md                    # Este archivo
├── CYBERSECURITY-ROADMAP.md     # Roadmap de aprendizaje de ciberseguridad
├── PROFILE-ANALYSIS.md          # Análisis de habilidades y perfil técnico
└── home/
    ├── Wallpapers/              # Wallpapers personalizados
    └── hyprland/                # Configuración modular de Hyprland
        ├── default.nix          # Entry point
        ├── input.nix            # Teclado, mouse, touchpad
        ├── binds.nix            # Keybindings
        ├── monitor.nix          # Configuración de monitores
        ├── env.nix              # Variables de entorno
        ├── general.nix          # Gaps, borders
        ├── misc.nix             # Miscelánea
        ├── autostart.nix        # Aplicaciones al inicio
        └── appearance.nix       # Animaciones, blur, sombras
```

---

## 🛠️ Características Principales

### Sistema Base

- **Bootloader:** systemd-boot con EFI
- **Kernel:** Linux con parámetros AMD optimizados (`amdgpu.ppfeaturemask`, `dcfeaturemask`)
- **Filesystems:** ext4 (root), NTFS support para interoperabilidad con Windows
- **Networking:** NetworkManager
- **Locale:** Costa Rica (es_CR.UTF-8), teclado LATAM

### Entorno de Escritorio

- **Compositor:** Hyprland (Wayland)
- **Shell:** Noctalia Shell (barra lateral moderna)
- **Display Manager:** SDDM con tema Catppuccin Mocha
- **Terminal:** Ghostty
- **Launcher:** Vicinae
- **File Manager:** Thunar
- **Theming:** Catppuccin Mocha (GTK, iconos, cursors)

### Desarrollo

- **Editores:** Neovim, VSCodium, Emacs
- **Lenguajes:** Node.js 22, Python 3
- **Control de versiones:** Git con credential manager, GitHub CLI
- **Herramientas:** ripgrep, fzf, bat, eza, zoxide

### Gaming

- **Plataformas:** Steam, Lutris, Bottles, HydraLauncher
- **Compatibilidad:** Proton, ProtonUp-Qt, Protontricks, Wine, Winetricks
- **Optimización:** Gamemode

### Productividad

- **Notas:** Obsidian
- **Ofimática:** OnlyOffice Desktop Editors
- **PDF:** Zathura
- **Comunicación:** Vesktop (Discord)
- **Multimedia:** Kdenlive, Shotcut, Krita

### Seguridad (NEW!)

- **Hardening:** `security.nix` con configuración completa
- **Firewall:** nftables con reglas específicas
- **SSH:** Hardened (no root login, no password auth, algoritmos fuertes)
- **Fail2ban:** Protección contra brute-force
- **Kernel hardening:** sysctl params (ASLR, protección de memoria, etc.)
- **Auditoría:** auditd con reglas para archivos críticos
- **AppArmor:** Mandatory Access Control
- **Logging:** rsyslog + logrotate

Ver [`security.nix`](./security.nix) para detalles completos.

---

## 🔧 Uso Diario

### Comandos Útiles

```bash
# Reconstruir sistema (desde el repo)
sudo nixos-rebuild switch --flake ~/NixOs-Configuration#nixos

# Actualizar flake.lock (actualizar dependencias)
nix flake update

# Ver generaciones del sistema
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Rollback a generación anterior
sudo nixos-rebuild switch --rollback

# Garbage collection (limpiar generaciones antiguas)
sudo nix-collect-garbage -d

# Ver qué cambió entre generaciones
nix store diff-closures /nix/var/nix/profiles/system-{42,43}-link
```

### Aliases Configurados (en bash)

```bash
ls      # → eza --icons
ll      # → eza -la --icons
cat     # → bat
nrs     # → sudo nixos-rebuild switch --flake ~/nixos-config#nixos
hms     # → home-manager switch --flake ~/nixos-config#cedrick
```

---

## 📚 Documentación Adicional

### Para Entender Mi Perfil Técnico

- **[PROFILE-ANALYSIS.md](./PROFILE-ANALYSIS.md)** — Análisis detallado de mis habilidades, sistema de trabajo (GTD + Zettelkasten), ensayos filosóficos, y cómo todo esto se transfiere a ciberseguridad/DevOps.

### Para Aprender Ciberseguridad

- **[CYBERSECURITY-ROADMAP.md](./CYBERSECURITY-ROADMAP.md)** — Roadmap completo de 6 meses para pasar de "sé Linux y redes" a "sé ciberseguridad práctica". Incluye proyectos concretos, recursos, plataformas de práctica, y plan de acción detallado.

### Para Implementar Seguridad

- **[security.nix](./security.nix)** — Módulo de hardening completo con 20 secciones: firewall, SSH, fail2ban, kernel hardening, auditd, AppArmor, logging, y más. Cada sección está documentada con explicaciones y comandos útiles.

---

## 🎯 Contexto Personal

**Edad:** 16 años  
**Experiencia previa:** Ubuntu → Bazzite → Arch → CachyOS → NixOS  
**Tiempo en NixOS:** Desde marzo 2026 (2 semanas para sistema funcional, 2 meses de refinamiento)  
**Certificaciones:** CCNA (CISCO), Fundamentos de Ciberseguridad (CISCO)  
**Inglés:** B1 general, C1 reading (gracias a juegos, documentación técnica, y NixOS)

**Sistema de trabajo:**
- Org-mode (Emacs) para GTD (Getting Things Done)
- Obsidian para Zettelkasten (gestión de conocimiento)
- Git para versionado de todo (configs, notas, ensayos)
- Commits regulares como "deporte favorito"

**Filosofía de aprendizaje:**
```
Problema identificado → Investigación profunda → Sistema diseñado → Mantenimiento largo plazo
```

Ejemplos:
- Sistema frágil (perdí ensayo) → Aprendí NixOS → Repo declarativo → 22 commits en 2 meses
- Información dispersa → GTD + Zettelkasten → Org-mode + Obsidian → 1033 líneas, commits regulares
- Preguntas filosóficas → Kant, Husserl, Dennett → 2 ensayos académicos → Agregados al vault

---

## 🛡️ Próximos Pasos (Roadmap de Seguridad)

Ahora que tengo un sistema NixOS maduro y estable, mi siguiente objetivo es profundizar en ciberseguridad:

### Fase 1: Fundamentos (Mes 1-2)
- ✅ Implementar `security.nix` con una configuración personal de seguridad modular implementando firewall, SSH restrictions, fail2ban, auditd y AppArmor.
- [ ] TryHackMe: Complete Beginner Path (20+ rooms)
- [ ] OverTheWire: Bandit (todos los niveles)
- [ ] Análisis de red local con Wireshark + nmap

### Fase 2: Ofensiva (Mes 3-4)
- [ ] DVWA: Explotar todas las vulnerabilidades
- [ ] Metasploit: 10+ exploits documentados
- [ ] CTFs: 4 completados con writeups públicos
- [ ] Burp Suite: Auditar 1 web app completa

### Fase 3: Defensa (Mes 5-6)
- [ ] SIEM casero (Wazuh) con reglas de detección
- [ ] Incident response: Simulación completa
- [ ] Blue Team Labs Online: 10+ labs
- [ ] Threat intelligence: Mapear ataque real a MITRE ATT&CK

**Ver [CYBERSECURITY-ROADMAP.md](./CYBERSECURITY-ROADMAP.md) para el plan completo.**

---

## 🤝 Contribuciones y Feedback

Este repo es principalmente para mi uso personal, pero si encuentras algo útil o tienes sugerencias, siéntete libre de:

- Abrir un issue
- Hacer un fork y adaptar a tus necesidades
- Compartir feedback sobre el roadmap de ciberseguridad

**Nota:** Si usas este repo como base, recuerda:
1. Generar tu propio `hardware-configuration.nix`
2. Cambiar nombres de usuario, emails, etc.
3. Revisar `security.nix` y ajustar según tus necesidades

---

## 📜 Licencia

Este repo es de código abierto. Úsalo, modifícalo, aprende de él. No hay licencia formal porque es una configuración personal, pero el espíritu es: **comparte conocimiento, ayuda a otros a aprender**.

---

## 🙏 Agradecimientos

- **Comunidad de NixOS** — Por la documentación (aunque a veces críptica) y el soporte en Reddit/Discord
- **Comunidad de r/unixporn** — Por la inspiración visual
- **ChatGPT** — Por ayudarme a ordenar mis ideas (soy redundante y desordenado redactando)
- **Marco Aurelio** — Por las Meditaciones que inspiraron uno de mis ensayos filosóficos
- **Los juegos en inglés** — Por darme C1 en reading sin darme cuenta

---

## 📞 Contacto

- **GitHub:** [@Cedrick-Coto](https://github.com/Cedrick-Coto)
- **Email:** cedrick.coto@gmail.com

---

**Última actualización:** 2026-05-22  
**Versión de NixOS:** 25.11  
**Estado:** Activo, en constante refinamiento

---

*"La mejor configuración es la que entiendes completamente y puedes reproducir en cualquier momento."*
