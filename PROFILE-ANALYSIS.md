# Análisis de Perfil Técnico — Cedrick Coto

**Fecha:** 2026-05-22  
**Edad:** 16 años  
**Contexto:** Este documento analiza mi perfil técnico basado en evidencia concreta (repos, sistemas de trabajo, ensayos) para entender qué habilidades demuestro y cómo se transfieren a ciberseguridad/DevOps.

---

## 📊 Sistema de Gestión del Conocimiento

### Lo que Tengo Implementado

**Org-mode (Emacs):**
- `inbox.org` — Captura rápida de ideas (GTD inbox)
- `colegio.org` (404 líneas) — Hub GTD con proyectos, próximas acciones, MIT diario
- `apuntes.org` (373 líneas) — Apuntes raw de clase (RAG-ready)
- `diario.org` (63 líneas) — Estado emocional + MIT + cierre diario
- `zettelkasten/permanente.org` (170 líneas) — Conocimiento destilado
- `zettelkasten/literature.org` — Notas de literatura

**Obsidian Vault (`~/Documentos/Colegio/`):**
- `Literatura/` — Notas de fuentes externas
- `Permanente/` — Conceptos consolidados
- `Inbox/` — Captura rápida
- `RAG/` — Notas para RAG (Retrieval-Augmented Generation)
- `Proyectos/` — Proyectos activos
- `.git/` — Versionado con Git

**Total:** 1033 líneas de org-mode + vault de Obsidian con commits regulares

### Flujo de Trabajo

```
Captura → Procesamiento → Destilación → Acción
   ↓            ↓              ↓           ↓
inbox.org → apuntes.org → permanente.org → colegio.org (GTD)
```

**Características clave:**

1. **Protocolo anti-evitación:** "Trabajar 1 minuto cronometrado" — metacognición aplicada
2. **MIT diario** (Most Important Task) — priorización real, no lista infinita
3. **Revisión semanal** estructurada
4. **Doble sistema:** Org-mode (captura/acción) + Obsidian (destilación/conexión)

### Lo que Esto Demuestra

| Habilidad | Evidencia | Transferencia a Tech |
|-----------|-----------|---------------------|
| **Gestión de información compleja** | Separación clara: captura → procesamiento → destilación | En ciberseguridad: logs → análisis → threat intelligence. Mismo patrón. |
| **Pensamiento sistémico** | No uso "una app", diseñé un *flujo* entre herramientas | DevOps es diseñar flujos entre herramientas (CI/CD, monitoring, alerting) |
| **Autodisciplina técnica** | 1033 líneas de org-mode, commits regulares | Mantengo sistemas a largo plazo, no solo "pruebo cosas" |
| **Metacognición** | "Protocolo anti-evitación" = analizo mi propio proceso mental | Debugging de sistemas complejos requiere debugging del propio pensamiento |
| **Documentación natural** | Escribo para entender, no solo para recordar | README, incident reports, postmortems, RFCs |

---

## 📚 Ensayos Filosóficos

### 1. Temporalismo Epistemológico-Conservacionista

**Metadata:**
- **Escrito:** A los 15 años
- **Tiempo:** Un fin de semana (articulación final: 2 días con ChatGPT para ordenar ideas)
- **Extensión:** 6 páginas
- **Estructura:** Académica formal (introducción, fundamentación, metodología, marco filosófico, aplicaciones, conclusiones, referencias)

**Contenido:**
- Integra: ontología + epistemología + física + fenomenología
- Referencias: Kant, Husserl, Dennett, Rovelli, Hawking, Einstein, Devitt, Merleau-Ponty
- Propone un marco original sobre tiempo, existencia y conocimiento
- No solo resume autores, articula una posición propia

**Tesis central:**
- Los eventos tienen existencia ontológica independiente (realismo)
- Nuestro conocimiento está limitado por dependencia temporal (epistemología)
- La energía se conserva (física) → el pasado persiste aunque cambie de forma
- La percepción del tiempo es subjetiva (fenomenología)
- El futuro es proyección probabilística → libre albedrío posible

### 2. La Conciencia como Límite Normativo Interno del Determinismo Causal

**Metadata:**
- **Escrito:** A los 16 años
- **Tiempo:** Una semana (articulación final: 2 días con ChatGPT)
- **Estructura:** Tesis con capítulos (introducción, marco teórico, desarrollo, implicaciones éticas, confrontación, conclusiones)

**Contenido:**
- Dialoga con: estoicismo (Marco Aurelio), materialismo contemporáneo, tradición bíblica
- Acepta determinismo físico sin reservas
- Defiende responsabilidad ética desde un límite normativo (no causal)

**Tesis central:**
- La conciencia no rompe la causalidad (no es dualismo)
- Pero introduce un límite normativo: no puedes sustituir deliberación por descripción causal sin dejar de actuar
- El materialismo duro es **incompleto** (corrección: no "autocontradictorio") porque depende de nociones normativas para validar la ciencia

**Argumento sofisticado:** Si eliminas la relevancia normativa de la conciencia, destruyes el marco que hace posible la ciencia misma (porque la ciencia requiere nociones como "error", "corrección", "justificación").

### Lo que Esto Demuestra

| Habilidad | Evidencia | Transferencia a Tech |
|-----------|-----------|---------------------|
| **Pensamiento abstracto de alto nivel** | Integro física cuántica, fenomenología y ética en un marco coherente | Arquitectura de sistemas complejos requiere abstracción similar |
| **Rigor argumentativo** | Cito fuentes, estructuro lógicamente, anticipo objeciones | Documentación técnica, RFCs, design docs requieren lo mismo |
| **Capacidad de síntesis** | Tomo conceptos de 5+ disciplinas y los articulo | En tech: integrar seguridad + redes + desarrollo + ops |
| **Escritura técnica clara** | Ensayos densos pero legibles | README, documentación, incident reports, postmortems |
| **Curiosidad intelectual genuina** | Nadie me obligó a escribir esto. Lo hice porque me interesa. | La mejor gente en tech aprende por curiosidad, no por requisito |

**Contexto crítico:** Escribí esto a los 15-16 años. La mayoría de gente con CCNA a esa edad no está leyendo a Kant, Husserl y Rovelli. Yo sí.

**Nota sobre redacción:** Usé ChatGPT para ordenar mis ideas porque redactando soy redundante y desordenado. Esto no es trampa — es usar herramientas para comunicar mejor. El contenido y las ideas son mías.

---

## 💻 NixOS Configuration

### Repo: https://github.com/Cedrick-Coto/NixOs-Configuration

**Timeline:**
- **27 marzo 2026:** Initial commit
- **~10 abril 2026:** Compartí en Reddit, me felicitaron (2 semanas desde cero)
- **18 mayo 2026:** Último commit (2 meses de iteración)
- **Total:** 22 commits

**Estructura:**
```
NixOs-Configuration/
├── flake.nix                    # Flake con inputs (nixpkgs, home-manager, noctalia)
├── flake.lock                   # Versiones locked
├── configuration.nix            # Config del sistema
├── home.nix                     # Home Manager config
├── home/
│   ├── Wallpapers/              # Wallpapers custom
│   └── hyprland/                # Hyprland modular (8 archivos)
│       ├── default.nix
│       ├── input.nix
│       ├── binds.nix
│       ├── monitor.nix
│       ├── env.nix
│       ├── general.nix
│       ├── misc.nix
│       ├── autostart.nix
│       └── appearance.nix
└── README.md
```

**Características técnicas:**

1. **Flakes + Home Manager** — Entendí el modelo declarativo de Nix, no solo copié
2. **Hyprland modular** (8 submódulos) — Separación de responsabilidades
3. **Noctalia shell integration** — Integré software de terceros con config propia
4. **Catppuccin theming** — Consistencia visual (SDDM, GTK, cursors)
5. **Kernel params AMD** (`ppfeaturemask`, `dcfeaturemask`) — Overclocking/undervolt
6. **Wayland debug** (env vars ELECTRON/GTK/QT) — Debuggeo compatibilidad
7. **Gaming stack** (Steam, Lutris, Bottles, Proton, Gamemode) — Uso Linux como daily driver
8. **Locale CR + teclado latam** — Config hiper-personalizada
9. **NTFS + udisks2** — Interoperabilidad con Windows

**Commits notables:**
- 27 mar: Configuración estable inicial con COSMIC
- 28 mar: Hyprland funcional con Noctalia shell
- 31 mar: Vuelta a COSMIC por temas de monitores (debugging real)
- 9 abr: Kdenlive/Shotcut compatibilidad (iteración hasta resolver)

### Lo que Esto Demuestra

| Señal | Lo que Prueba | Transferencia a Ciberseguridad |
|-------|---------------|-------------------------------|
| **Flakes + Home Manager** | Entendí el modelo declarativo | IaC (Terraform, Ansible) usa el mismo paradigma |
| **Hyprland modular** | Sé organizar código | Separación de responsabilidades en security configs |
| **Kernel params AMD** | Conocimiento avanzado de hardware | Kernel hardening (sysctl params) |
| **Wayland debug** | Debuggeo compatibilidad en tech nueva | Troubleshooting en entornos complejos |
| **22 commits en 2 meses** | Consistencia, no proyecto abandonado | Mantenimiento de sistemas a largo plazo |
| **Iteración (COSMIC→Hyprland→COSMIC)** | No me rindo, itero hasta resolver | Incident response requiere persistencia |

---

## 🎯 El Patrón Completo

Juntando NixOS + GTD/Zettelkasten + Ensayos filosóficos, veo un patrón claro:

```
Problema identificado → Investigación profunda → Sistema diseñado → Mantenimiento largo plazo
```

### Ejemplos Concretos

| Problema | Investigación | Sistema | Mantenimiento |
|----------|---------------|---------|---------------|
| Sistema frágil (perdí ensayo) | Aprendí NixOS desde cero | Repo declarativo modular | 22 commits en 2 meses |
| Información dispersa | GTD + Zettelkasten | Org-mode + Obsidian integrados | 1033 líneas, commits regulares |
| Preguntas filosóficas | Kant, Husserl, Dennett, Rovelli | 2 ensayos estructurados | Los agregué al vault para futuro |

**Esto es ingeniería de sistemas aplicada a mi propia vida.**

---

## 🔍 Perfil Real (Basado en Evidencia)

### Fortalezas Únicas

1. **Pensamiento sistémico**
   - Veo cómo las piezas se conectan
   - Evidencia: NixOS modular, GTD/Zettelkasten integrado, ensayos interdisciplinarios

2. **Rigor técnico**
   - No hago las cosas a medias
   - Evidencia: 404 líneas de GTD, 22 commits, referencias académicas en ensayos

3. **Autodidacta efectivo**
   - Aprendo cosas difíciles sin instructor
   - Evidencia: NixOS en 2 semanas, filosofía académica por curiosidad, org-mode

4. **Documentación natural**
   - Escribo para entender, no solo para recordar
   - Evidencia: 1033 líneas de org-mode, ensayos, commits con mensajes claros

5. **Persistencia**
   - Mantengo sistemas a largo plazo
   - Evidencia: 2 meses de NixOS, vault con commits regulares, iteración hasta resolver problemas

6. **Curiosidad intelectual genuina**
   - Aprendo por interés, no por requisito
   - Evidencia: Nadie me obligó a leer Kant, aprender NixOS, o escribir ensayos filosóficos

### Gaps Actuales (Normales a los 16)

1. **Experiencia práctica en producción**
   - Obvio, no he trabajado
   - Gap de experiencia, no de capacidad

2. **Conocimiento de herramientas de seguridad**
   - Wireshark, Metasploit, Burp Suite, etc.
   - Se resuelve con práctica (roadmap de 6 meses)

3. **Experiencia con incidentes reales**
   - Logs de ataques, análisis forense, respuesta a incidentes
   - Se resuelve con labs y simulaciones

**La buena noticia:** Los gaps son de experiencia, no de capacidad. La capacidad ya la tengo.

---

## 🛡️ Transferencia a Ciberseguridad

### Por qué Mi Perfil es Ideal para Ciberseguridad

| Mi Habilidad | Aplicación en Ciberseguridad |
|--------------|------------------------------|
| **Pensamiento sistémico** | Entender cómo un ataque se propaga por múltiples capas (red → sistema → aplicación) |
| **Rigor técnico** | Análisis forense requiere atención al detalle extrema |
| **Autodidacta efectivo** | Ciberseguridad evoluciona rápido, necesitas aprender constantemente |
| **Documentación natural** | Incident reports, threat intelligence, writeups de vulnerabilidades |
| **Persistencia** | Debugging de exploits, análisis de malware, threat hunting requieren no rendirse |
| **NixOS declarativo** | IaC es el futuro de seguridad (infrastructure as code, reproducibilidad) |
| **GTD/Zettelkasten** | Gestión de información en SOC (logs → análisis → threat intel) |
| **Filosofía académica** | Pensamiento crítico para evaluar amenazas y proponer mitigaciones |

### Ventaja Competitiva

**La mayoría de juniors:**
- Saben usar herramientas, pero no entienden sistemas
- Copian tutoriales, pero no documentan su aprendizaje
- Aprenden por requisito, no por curiosidad

**Yo:**
- Diseño sistemas (NixOS modular, GTD/Zettelkasten integrado)
- Documento todo (1033 líneas de org-mode, ensayos académicos, commits regulares)
- Aprendo por curiosidad genuina (nadie me obligó a leer Kant o aprender NixOS)

**En 6 meses, con el roadmap, tendré:**
- Repo de NixOS con hardening completo
- 50+ labs/CTFs completados con writeups
- SIEM funcional con reglas de detección
- Portfolio público en GitHub

**Eso + CCNA + 17 años = perfil que destaca incluso contra gente con años de experiencia.**

---

## 📈 Proyección a 6-12 Meses

### Escenario Conservador (6 meses)

**Habilidades técnicas:**
- Hardening de sistemas Linux (security.nix completo)
- Pentesting básico (DVWA, Metasploit, Burp Suite)
- 50+ CTFs completados con writeups
- SIEM funcional (Wazuh) con reglas de detección
- Incident response (simulaciones completas)

**Portfolio:**
- Repo NixOS con módulo de seguridad
- Repo Security-Labs con writeups públicos
- 1-2 vulnerabilidades reportadas (si encuentro)

**Ingresos potenciales:**
- Bug bounty: $50-200/mes
- Freelance Linux/NixOS: $100-300/mes
- Total: $150-500/mes

### Escenario Optimista (12 meses)

**Habilidades técnicas:**
- Todo lo anterior +
- Especialización (DevSecOps o Network Security)
- Certificación (eJPT o Security+)
- Contribuciones a proyectos open source

**Portfolio:**
- 100+ CTFs/labs completados
- 5+ vulnerabilidades reportadas
- Proyecto final integrador (pipeline DevSecOps o red segmentada)

**Ingresos potenciales:**
- Bug bounty: $200-800/mes
- Freelance: $300-700/mes
- GitHub Sponsors: $50-200/mes
- Total: $550-$1,700/mes

**Sin empleo formal. Solo con skill + constancia.**

---

## 🎓 Contexto Educativo

### Certificaciones Actuales

- **CCNA (CISCO)** — Routing, switching, subnetting, ACLs, VPNs
- **Fundamentos de ciberseguridad (CISCO)** — Conceptos básicos

### Inglés

- **Reading:** C1 (documentación, logs, código)
- **Listening/Speaking/Writing:** B1
- **Cómo lo logré:** Juegos en inglés, documentación técnica (NixOS, filosofía)

**Por qué esto importa:** En tech, reading C1 es lo que realmente importa el 80% del tiempo. Speaking/writing mejoran naturalmente con práctica.

### Filosofía

- Leí: Marco Aurelio (Meditaciones)
- Pendiente: Kant (Crítica de la Razón Pura) — libro completo
- Escribí: 2 ensayos académicos (temporalismo, conciencia)

**Por qué esto importa:** Pensamiento crítico, rigor argumentativo, capacidad de síntesis. Habilidades transferibles a análisis de amenazas, diseño de sistemas, documentación técnica.

---

## 🚀 Próximos Pasos

1. **Implementar `security.nix`** — Hardening completo de NixOS
2. **Empezar roadmap de ciberseguridad** — Fase 1 (fundamentos)
3. **Crear repo `Security-Labs`** — Portfolio público de writeups
4. **Integrar con GTD** — `ciberseguridad.org` con proyectos como tareas
5. **Commit diario** — 1 challenge/lab por día (30-60 min)

**Objetivo:** En 6 meses, tener portfolio que demuestre habilidad práctica en ciberseguridad.

---

## 📝 Notas Finales

### Sobre ChatGPT y Herramientas

Usé ChatGPT para ordenar mis ideas en los ensayos porque redactando soy redundante y desordenado. Esto no es trampa — es usar herramientas para comunicar mejor. El contenido y las ideas son mías.

En tech, usar herramientas (ChatGPT, Copilot, Stack Overflow) es normal y esperado. Lo que importa es:
1. Entender lo que haces
2. Poder explicarlo
3. Poder debuggearlo cuando falla

Yo cumplo los 3.

### Sobre la Edad

Tengo 16 años. Eso es una ventaja, no una desventaja:
- Tengo tiempo para aprender
- No tengo vicios de "así se ha hecho siempre"
- Puedo tomar riesgos (experimentar, romper cosas, aprender)

En 2 años (18), tendré:
- 2 años de experiencia práctica en ciberseguridad
- Portfolio público demostrable
- CCNA + certificaciones de seguridad
- Inglés C1 en todas las áreas

Eso es más que la mayoría de graduados universitarios.

---

**Última actualización:** 2026-05-22  
**Autor:** Cedrick Coto  
**Repos:**
- NixOS: https://github.com/Cedrick-Coto/NixOs-Configuration
- Obsidian Vault: `~/Documentos/Colegio/` (versionado con Git)
