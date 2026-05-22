# Roadmap de Ciberseguridad — Cedrick Coto

**Contexto:** Este roadmap fue diseñado específicamente para mi perfil a los 16 años, con CCNA, NixOS avanzado, sistema GTD/Zettelkasten, y ganas de convertir la ciberseguridad en mi "deporte favorito" (como lo fue NixOS con commits diarios).

**Objetivo:** En 6 meses, pasar de "sé Linux y redes" a "sé ciberseguridad práctica" con portfolio público demostrable.

**Filosofía:** Mismo proceso que con NixOS — aprender haciendo, documentar todo, commits regulares, construir sistemas.

---

## 🎯 Mi Perfil Actual (Punto de Partida)

### Fortalezas

- **Linux avanzado:** NixOS declarativo, kernel params, Wayland, bootchain, modularización
- **Redes:** CCNA (routing, switching, subnetting, ACLs, VPNs)
- **IaC mindset:** Git como source of truth, reproducibilidad, rollback
- **Pensamiento sistémico:** Diseño de sistemas complejos (NixOS modular, GTD/Zettelkasten)
- **Autodidacta efectivo:** Aprendí NixOS en 2 semanas, filosofía académica por curiosidad
- **Documentación natural:** 1033 líneas de org-mode, ensayos filosóficos, commits regulares
- **Inglés técnico:** C1 reading (documentación, logs, código)

### Gaps (normales a los 16)

- Experiencia con herramientas de seguridad (Wireshark, Metasploit, Burp Suite, etc.)
- Práctica ofensiva (pentesting, CTFs, exploits)
- Práctica defensiva (SIEM, incident response, threat hunting)
- Experiencia con incidentes reales

**La buena noticia:** Los gaps son de experiencia, no de capacidad. La capacidad ya la tengo.

---

## 📅 Plan de 6 Meses (Estructura General)

| Fase | Duración | Objetivo | Entregable |
|------|----------|----------|------------|
| **Fase 1: Fundamentos** | Mes 1-2 | Hardening + análisis de red + logs | `security.nix` + 20 labs completados |
| **Fase 2: Ofensiva** | Mes 3-4 | Pentesting + CTFs + exploits | 10+ CTFs con writeups públicos |
| **Fase 3: Defensa** | Mes 5-6 | SIEM + incident response + detección | SIEM funcional + incident reports |
| **Fase 4: Especialización** | Continuo | DevSecOps / Network Security / AppSec | Proyecto final integrador |

---

## 🛡️ Fase 1: Fundamentos Prácticos (Mes 1-2)

### Objetivo

Pasar de "sé Linux" a "sé seguridad en Linux". Usar lo que ya sé (NixOS) para aprender seguridad.

### Proyectos Concretos

#### 1. Hardening de NixOS (Semana 1-2)

**Qué hacer:**

- Crear `security.nix` en mi repo con:
  - Firewall rules específicas (no solo `enable = true`)
  - fail2ban para SSH brute-force protection
  - AppArmor/SELinux profiles
  - Kernel hardening (sysctl params)
  - Automatic security updates
  - Audit logging (auditd)
  - File integrity monitoring (AIDE)

**Por qué esto:**

- Uso lo que ya sé (NixOS) para aprender seguridad
- Queda documentado en mi repo público
- Es evidencia de que sé hardening de sistemas

**Recursos:**

- NixOS Security Wiki
- CIS Benchmarks for Linux
- NIST Cybersecurity Framework

#### 2. Monitoring y Logging (Semana 3-4)

**Qué hacer:**

- Configurar auditd para monitorear:
  - Intentos de login fallidos
  - Cambios en `/etc/`, `/boot/`, archivos críticos
  - Ejecución de comandos privilegiados (sudo)
  - Procesos sospechosos
- Centralizar logs con rsyslog
- Crear alertas básicas

**Por qué esto:**

- Aprendo a leer logs (70% del trabajo de SOC)
- Entiendo qué es "normal" vs "sospechoso"

**Recursos:**

- `man auditd`
- Linux Audit Framework documentation

#### 3. Análisis de Red Local (Semana 5-6)

**Qué hacer:**

- Instalar: Wireshark, tcpdump, nmap, netstat
- Proyecto:
  1. Escanear mi red local con nmap (descubrir dispositivos)
  2. Capturar tráfico con Wireshark (identificar protocolos)
  3. Analizar: ¿qué dispositivos hablan con qué? ¿qué puertos están abiertos?
  4. Documentar: mapa de red con todos los dispositivos

**Por qué esto:**

- Mi CCNA me da teoría de redes
- Esto me da práctica de seguridad en redes
- Aprendo a usar Wireshark (herramienta crítica)

**Recursos:**

- Wireshark documentation
- Nmap Network Scanning book (gratis online)

#### 4. TryHackMe: Complete Beginner Path (Semana 7-8)

**Qué hacer:**

- Completar 15-20 rooms del "Complete Beginner Path"
- Documentar cada room en Zettelkasten (nota permanente por concepto)
- Writeup de cada challenge

**Por qué esto:**

- Labs prácticos guiados
- Aprendo metodología de pentesting
- Empiezo a construir portfolio público

**Recursos:**

- TryHackMe (gratis con cuenta básica)

### Entregable Fase 1

- ✅ `security.nix` completo en repo NixOS
- ✅ 20+ labs de TryHackMe completados
- ✅ Writeups en Zettelkasten
- ✅ Mapa de red local documentado

---

## ⚔️ Fase 2: Práctica Ofensiva (Mes 3-4)

### Objetivo

Entender cómo atacan para saber cómo defender. "No puedes defender lo que no entiendes cómo se ataca."

### Proyectos Concretos

#### 1. DVWA — Damn Vulnerable Web App (Semana 9-10)

**Qué hacer:**

- Montar DVWA en contenedor Docker
- Explotar todas las vulnerabilidades:
  - SQL Injection
  - XSS (Cross-Site Scripting)
  - CSRF (Cross-Site Request Forgery)
  - Command Injection
  - File Upload vulnerabilities
  - Insecure CAPTCHA
- Documentar cada exploit con:
  - Descripción de la vulnerabilidad
  - Cómo explotarla (paso a paso)
  - Cómo mitigarla
  - Código/payload usado

**Por qué esto:**

- Aprendo las vulnerabilidades web más comunes (OWASP Top 10)
- Entiendo cómo funcionan los exploits
- Practico en entorno seguro (no ilegal)

**Recursos:**

- DVWA GitHub
- OWASP Top 10 documentation

#### 2. Metasploit Framework (Semana 11)

**Qué hacer:**

- Instalar Metasploit en NixOS
- Montar Metasploitable 2 (VM vulnerable)
- Explotar 10+ vulnerabilidades con Metasploit:
  - vsftpd backdoor
  - Samba exploits
  - SSH brute-force
  - Web app exploits
- Documentar cada exploit

**Por qué esto:**

- Metasploit es la herramienta estándar de pentesting
- Aprendo metodología de explotación
- Entiendo post-exploitation (qué hacer después de entrar)

**Recursos:**

- Metasploit Unleashed (curso gratis)
- Metasploitable 2 documentation

#### 3. CTFs — Capture The Flag (Semana 12-16)

**Qué hacer:**

- **Objetivo:** 1 CTF por semana (4 total)
- Plataformas:
  - PicoCTF (beginner-friendly)
  - TryHackMe CTF rooms
  - HackTheBox retired machines (gratis)
- Writeup completo de cada CTF:
  - Reconocimiento (nmap, dirb, etc.)
  - Explotación (qué vulnerabilidad, cómo la explotaste)
  - Escalación de privilegios
  - Flags capturadas
  - Lecciones aprendidas

**Por qué esto:**

- Los CTFs son el "deporte" de ciberseguridad
- Practico metodología completa (recon → exploit → post-exploit)
- Construyo portfolio público (writeups en GitHub)

**Recursos:**

- PicoCTF
- TryHackMe
- HackTheBox
- YouTube: IppSec (walkthrough de máquinas HTB)

#### 4. Burp Suite — Web App Pentesting (Semana 13-14)

**Qué hacer:**

- Instalar Burp Suite Community Edition
- Aprender a usar:
  - Proxy (interceptar requests)
  - Repeater (modificar y reenviar requests)
  - Intruder (fuzzing, brute-force)
  - Scanner (automated vulnerability detection)
- Proyecto: Auditar una web app vulnerable (DVWA, bWAPP, o WebGoat)

**Por qué esto:**

- Burp Suite es la herramienta estándar para web app pentesting
- Aprendo a interceptar y modificar tráfico HTTP
- Entiendo cómo funcionan las web apps por dentro

**Recursos:**

- PortSwigger Web Security Academy (gratis, excelente)

### Entregable Fase 2

- ✅ DVWA completamente explotado (todas las vulnerabilidades)
- ✅ 10+ exploits de Metasploit documentados
- ✅ 4 CTFs completados con writeups públicos
- ✅ Burp Suite: 1 web app auditada completamente

---

## 🛡️ Fase 3: Práctica Defensiva (Mes 5-6)

### Objetivo

Pasar de atacar a defender. Aprender a detectar, responder y mitigar ataques.

### Proyectos Concretos

#### 1. SIEM Casero — Wazuh (Semana 17-20)

**Qué hacer:**

- Instalar Wazuh (SIEM open source) en servidor local o VM
- Configurar:
  - Ingesta de logs de mi NixOS
  - Reglas de detección para:
    - SSH brute-force
    - Cambios en archivos críticos
    - Procesos sospechosos
    - Escaneos de red (nmap)
  - Dashboard con métricas de seguridad
- Proyecto: Simular ataques (con Metasploit) y detectarlos con Wazuh

**Por qué esto:**

- SIEM es la herramienta principal de SOC
- Aprendo a escribir reglas de detección
- Entiendo cómo correlacionar eventos

**Recursos:**

- Wazuh documentation
- Wazuh Ruleset (ejemplos de reglas)

#### 2. Incident Response (Semana 21-22)

**Qué hacer:**

- Escenario: Simular que mi sistema fue comprometido
  - Instalar un backdoor en VM
  - Simular exfiltración de datos
  - Dejar "evidencia" (logs, archivos modificados)
- Tarea: Análisis forense
  1. **Identificación:** ¿Qué pasó? ¿Cuándo?
  2. **Contención:** ¿Cómo detengo el ataque?
  3. **Erradicación:** ¿Cómo elimino la amenaza?
  4. **Recuperación:** ¿Cómo restauro el sistema?
  5. **Lecciones aprendidas:** ¿Qué falló? ¿Cómo prevenirlo?
- Documentar: Incident report completo (formato profesional)

**Por qué esto:**

- Esto es lo que haré en un trabajo de seguridad real
- Aprendo metodología de incident response (NIST framework)
- Practico análisis forense

**Recursos:**

- NIST Incident Response Guide
- SANS Incident Handler's Handbook

#### 3. Blue Team Labs Online (Semana 23-24)

**Qué hacer:**

- Completar 10+ labs de Blue Team Labs Online
- Categorías:
  - Log analysis
  - Network traffic analysis
  - Malware analysis
  - Digital forensics
- Documentar cada lab en Zettelkasten

**Por qué esto:**

- Labs prácticos de defensa (complemento de TryHackMe)
- Aprendo a analizar evidencia de ataques reales
- Practico con herramientas de blue team

**Recursos:**

- Blue Team Labs Online
- LetsDefend (alternativa)

#### 4. Threat Intelligence — MITRE ATT&CK (Semana 23-24)

**Qué hacer:**

- Estudiar MITRE ATT&CK framework
- Proyecto: Mapear un ataque real (buscar case study) al framework
  - Ejemplo: Ataque de ransomware WannaCry
  - Identificar: Tácticas, técnicas y procedimientos (TTPs)
  - Mapear cada fase del ataque a ATT&CK
  - Proponer: Controles de detección y mitigación
- Documentar en formato de threat intelligence report

**Por qué esto:**

- ATT&CK es el framework estándar de la industria
- Aprendo a pensar como atacante y defensor
- Entiendo cómo estructurar threat intelligence

**Recursos:**

- MITRE ATT&CK website
- ATT&CK Navigator (herramienta visual)

### Entregable Fase 3

- ✅ SIEM (Wazuh) funcional con reglas de detección
- ✅ Incident report completo de simulación
- ✅ 10+ labs de Blue Team completados
- ✅ Threat intelligence report de ataque real

---

## 🚀 Fase 4: Especialización (Mes 7+)

### Opciones de Especialización

#### Opción A: DevSecOps (Recomendado para mí)

**Por qué:** Combina mi conocimiento de NixOS (IaC) + desarrollo + seguridad

**Qué aprender:**

- CI/CD security: SAST, DAST, dependency scanning
- Container security: Docker, Kubernetes, Trivy
- Infrastructure as Code security: Terraform, Ansible
- Secret management: Vault, SOPS

**Proyecto:**

- Pipeline completo con GitLab CI/GitHub Actions:
  - SAST (SonarQube)
  - DAST (OWASP ZAP)
  - Dependency scanning (Snyk, Trivy)
  - Container scanning
  - Automated deployment con security checks

#### Opción B: Network Security (Alineado con CCNA)

**Qué aprender:**

- Firewalls: pfSense, OPNsense
- IDS/IPS: Snort, Suricata
- VPNs: OpenVPN, WireGuard
- Network segmentation, DMZ, VLANs

**Proyecto:**

- Montar red segmentada con:
  - Firewall con reglas avanzadas
  - IDS/IPS detectando ataques
  - DMZ para servicios públicos
  - VPN para acceso remoto seguro

#### Opción C: Application Security

**Qué aprender:**

- OWASP Top 10 en profundidad
- Secure coding practices
- Code review para seguridad
- SAST/DAST tools

**Proyecto:**

- Auditar una app open source:
  - Encontrar vulnerabilidades
  - Reportar responsablemente
  - Proponer fixes
  - Contribuir patches

#### Opción D: Cloud Security

**Qué aprender:**

- AWS/Azure/GCP security
- IAM, security groups, compliance
- Cloud-native security tools

**Proyecto:**

- Desplegar infra en AWS con Terraform
- Implementar security best practices
- Configurar monitoring y alerting

---

## 🎮 Mi "Deporte Favorito" — El Commit Diario

### Nuevo Hábito: 1 Challenge/Lab por Día

**Objetivo:** 30-60 minutos diarios de práctica

**Tracking:**

- En `colegio.org` como MIT diario
- Cada challenge → nota permanente en Zettelkasten
- Repo público: `~/Security-Labs` con writeups

**Por qué esto funciona para mí:**

- Ya tengo el hábito del "commit diario" (NixOS)
- Ya tengo el sistema de documentación (GTD + Zettelkasten)
- Los CTFs son adictivos (como los juegos que me dieron C1 en reading)
- Cada writeup es evidencia pública de mi habilidad

### Plataformas para Práctica Diaria

| Plataforma | Tipo | Dificultad | Gratis |
|------------|------|------------|--------|
| **TryHackMe** | Ofensiva + Defensiva | Beginner-Intermediate | Sí (con límites) |
| **HackTheBox** | Ofensiva | Intermediate-Advanced | Sí (máquinas retired) |
| **PicoCTF** | CTF | Beginner | Sí |
| **OverTheWire** | Linux/Scripting | Beginner-Intermediate | Sí |
| **Blue Team Labs** | Defensiva | Beginner-Intermediate | Sí (con límites) |
| **LetsDefend** | SOC Simulation | Intermediate | Sí (con límites) |

---

## 💻 Setup Técnico

### Opción 1: Compu Dinosaurio como Lab (Mi Idea Original)

**Qué hacer:**

- Instalar NixOS minimal en compu vieja
- Configurar como servidor de labs:
  - VMs con VirtualBox/QEMU (Metasploitable, DVWA, etc.)
  - Wazuh SIEM
  - Cloudflare Tunnel para acceso remoto seguro
- Usar como:
  - **Red Team:** Atacar las VMs vulnerables
  - **Blue Team:** Detectar ataques con SIEM

**Ventajas:**

- Entorno aislado (no afecta mi sistema principal)
- Puedo romper cosas sin miedo
- Aprendo a administrar servidores
- Cloudflare Tunnel = acceso remoto seguro sin exponer IP

**Desventajas:**

- Requiere hardware extra (pero ya lo tengo)

### Opción 2: VMs en Mi Sistema Principal

**Qué hacer:**

- VirtualBox/QEMU con VMs:
  - Kali Linux (herramientas de pentesting)
  - Metasploitable 2 (target vulnerable)
  - Windows VM (para malware analysis en sandbox)
- Red interna aislada (no conectada a internet)

**Ventajas:**

- No requiere hardware extra
- Más fácil de configurar

**Desventajas:**

- Consume recursos de mi sistema principal

### Opción 3: Cloud (AWS/Azure Free Tier)

**Qué hacer:**

- Usar free tier de AWS/Azure para:
  - VMs en la nube
  - Practicar cloud security
  - Desplegar labs temporales

**Ventajas:**

- No consume recursos locales
- Aprendo cloud al mismo tiempo

**Desventajas:**

- Free tier tiene límites
- Requiere cuidado para no generar costos

**Mi recomendación:** Empezar con Opción 2 (VMs locales), luego agregar Opción 1 (compu dinosaurio) cuando tenga tiempo de configurarla.

---

## 📚 Recursos Clave

### Plataformas de Aprendizaje (Gratis)

- **TryHackMe** — Labs guiados, excelente para empezar
- **HackTheBox** — Máquinas más realistas, más difíciles
- **OverTheWire** — Wargames de Linux/scripting
- **PicoCTF** — CTF beginner-friendly
- **Blue Team Labs Online** — Labs de defensa
- **PortSwigger Web Security Academy** — Web app security (gratis, excelente)

### Documentación y Referencias

- **OWASP** — Vulnerabilidades web, guías de seguridad
- **MITRE ATT&CK** — Framework de tácticas y técnicas de atacantes
- **NIST Cybersecurity Framework** — Estándares de seguridad
- **CIS Benchmarks** — Hardening guides para sistemas

### Libros (Gratis Online)

- **Metasploit Unleashed** — Curso completo de Metasploit
- **Nmap Network Scanning** — Guía completa de nmap
- **OWASP Testing Guide** — Metodología de pentesting web

### YouTube Channels

- **IppSec** — Walkthrough de máquinas HTB (aprendo metodología)
- **John Hammond** — CTF writeups, malware analysis
- **LiveOverflow** — Hacking, binary exploitation
- **NetworkChuck** — Networking + security (beginner-friendly)

---

## 🏆 Portfolio Público — Evidencia de Habilidad

### Qué Incluir en Mi GitHub

1. **Repo NixOS con `security.nix`**
   - Hardening completo
   - Documentado con comentarios
   - README explicando cada decisión de seguridad

2. **Repo `Security-Labs`**
   - Writeups de CTFs
   - Writeups de labs (TryHackMe, HTB, etc.)
   - Estructura: `CTFs/`, `Labs/`, `Tools/`, `Notes/`

3. **Repo `Vulnerability-Reports`** (si encuentro vulnerabilidades)
   - Responsible disclosure reports
   - Proof of concept (PoC)
   - Mitigations propuestas

4. **Repo `Security-Tools`**
   - Scripts propios (automation, analysis, etc.)
   - Herramientas que desarrolle

### Formato de Writeups

Cada writeup debe incluir:

1. **Información básica**
   - Nombre del challenge/máquina
   - Plataforma (TryHackMe, HTB, etc.)
   - Dificultad
   - Fecha completada

2. **Reconocimiento**
   - Qué herramientas usé (nmap, dirb, etc.)
   - Qué encontré (puertos abiertos, servicios, etc.)

3. **Explotación**
   - Vulnerabilidad identificada
   - Cómo la exploté (paso a paso)
   - Payloads/comandos usados

4. **Post-explotación** (si aplica)
   - Escalación de privilegios
   - Persistencia
   - Exfiltración de datos

5. **Lecciones aprendidas**
   - Qué aprendí
   - Qué haría diferente
   - Cómo mitigar esta vulnerabilidad

6. **Referencias**
   - Links a recursos útiles
   - Herramientas usadas

---

## 🎯 Métricas de Progreso

### Mes 1-2 (Fundamentos)

- [ ] `security.nix` completo y commiteado
- [ ] 20+ rooms de TryHackMe completadas
- [ ] Mapa de red local documentado
- [ ] 10+ notas permanentes en Zettelkasten sobre seguridad

### Mes 3-4 (Ofensiva)

- [ ] DVWA completamente explotado (todas las vulnerabilidades)
- [ ] 10+ exploits de Metasploit documentados
- [ ] 4 CTFs completados con writeups públicos
- [ ] 1 web app auditada con Burp Suite

### Mes 5-6 (Defensa)

- [ ] Wazuh SIEM funcional con reglas custom
- [ ] 1 incident report completo
- [ ] 10+ labs de Blue Team completados
- [ ] 1 threat intelligence report de ataque real

### Mes 7+ (Especialización)

- [ ] Proyecto final de especialización completado
- [ ] Portfolio público con 20+ writeups
- [ ] 1+ vulnerabilidad reportada responsablemente (si encuentro)

---

## 🚨 Consideraciones Legales y Éticas

### Reglas de Oro

1. **NUNCA atacar sistemas sin permiso explícito**
   - Solo practicar en:
     - Mis propios sistemas
     - Labs diseñados para eso (TryHackMe, HTB, DVWA, etc.)
     - Sistemas con bug bounty programs (cuando tenga experiencia)

2. **Responsible Disclosure**
   - Si encuentro una vulnerabilidad real:
     1. Reportar al vendor/maintainer primero (privadamente)
     2. Dar tiempo razonable para fix (90 días estándar)
     3. Publicar después de fix (con permiso)

3. **No usar conocimientos para dañar**
   - El objetivo es aprender a defender, no a atacar
   - La ética es fundamental en ciberseguridad

4. **Respetar privacidad**
   - No acceder a datos personales sin permiso
   - No compartir información sensible

### Bug Bounty Programs (Para el Futuro)

Cuando tenga experiencia, puedo participar en:

- **HackerOne** — Plataforma de bug bounties
- **Bugcrowd** — Similar a HackerOne
- **Open Bug Bounty** — Para proyectos open source

**Ventajas:**

- Legal y ético (con permiso explícito)
- Puedo ganar dinero (aunque sea menor de edad, con permiso de padres)
- Evidencia de habilidad (hall of fame, CVEs)

---

## 🎓 Certificaciones (Para el Futuro)

### Certificaciones Entry-Level (Después de 6 meses de práctica)

1. **CompTIA Security+**
   - Fundamentos de seguridad
   - Reconocida en la industria
   - Costo: ~$400

2. **CEH (Certified Ethical Hacker)**
   - Pentesting
   - Más cara (~$1,200)
   - Requiere experiencia o training oficial

3. **eJPT (eLearnSecurity Junior Penetration Tester)**
   - Pentesting práctico
   - Más barata (~$200)
   - Examen 100% práctico (no multiple choice)

### Certificaciones Avanzadas (Años después)

- **OSCP (Offensive Security Certified Professional)** — El estándar de oro de pentesting
- **CISSP (Certified Information Systems Security Professional)** — Para management
- **GIAC certifications** — Especializadas (forense, incident response, etc.)

**Mi recomendación:** Primero práctica (6-12 meses), luego certificaciones. Las certificaciones validan conocimiento, pero la práctica es lo que realmente importa.

---

## 💡 Consejos Finales

### 1. Documentar TODO

- Cada lab, cada CTF, cada concepto nuevo → Zettelkasten
- Writeups públicos en GitHub
- Esto es mi portfolio y mi memoria externa

### 2. Consistencia > Intensidad

- Mejor 1 hora diaria que 10 horas un día y nada el resto de la semana
- El "commit diario" funciona porque es sostenible

### 3. Aprender en Público

- Compartir writeups en GitHub
- Participar en comunidades (Reddit: r/netsec, r/AskNetsec, Discord servers)
- Ayudar a otros (enseñar es la mejor forma de aprender)

### 4. No Compararse

- Hay gente con años de experiencia
- Mi ventaja: empecé a los 16, tengo tiempo
- Comparar con mi yo de ayer, no con otros

### 5. Disfrutar el Proceso

- Si no es divertido, no es sostenible
- Los CTFs son juegos, tratarlos como tal
- Celebrar cada pequeño logro

---

## 📞 Comunidades y Recursos

### Discord Servers

- **TryHackMe Official**
- **HackTheBox Official**
- **The Cyber Mentor** (TCM Security)

### Reddit

- r/cybersecurity
- r/netsec
- r/AskNetsec
- r/HowToHack

### Twitter/X

- Seguir: @IppSec, @thecybermentor, @stokfredrik, @malwareunicorn

---

## 🎉 Conclusión

Este roadmap está diseñado específicamente para mí, con mi perfil, mis fortalezas, y mis ganas de convertir la ciberseguridad en mi "deporte favorito".

**En 6 meses, tendré:**

- Repo de NixOS con hardening completo
- 50+ labs/CTFs completados con writeups
- SIEM funcional con reglas de detección
- Portfolio público en GitHub
- Experiencia práctica en ofensiva y defensiva

**Eso + CCNA + 17 años = perfil que destaca.**

**Ahora, a juguetear con lo que me gusta. ¡Que empiecen las vacaciones!**

---

**Última actualización:** 2026-05-22  
**Autor:** Cedrick Coto  
**Repo:** https://github.com/Cedrick-Coto/NixOs-Configuration
