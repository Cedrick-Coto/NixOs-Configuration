# NixOS Configuration

Declarative, reproducible NixOS flake with a modular architecture — designed for **cross-platform C#/.NET development** on Niri Wayland compositor.

## Why NixOS?

- **Reproducible**: Same system from a single `flake.lock` — every time, everywhere
- **Atomic**: Upgrades either succeed or roll back. No half-broken systems
- **Declarative**: The entire OS is defined in code. No drift, no snowflake servers
- **Flakes**: Locked dependencies, composable inputs, single-command deployment

## Features

- **C# IDE in Neovim** — OmniSharp LSP, nvim-dap + netcoredbg, neotest-dotnet, telescope integration
- **Cross-platform .NET templates** — `.editorconfig`, `.gitattributes`, `Directory.Build.props` — zero diff between Windows (Visual Studio) and Linux (Neovim)
- **Niri compositor** — scrollable-tiling Wayland compositor with greetd + tuigreet
- **Modular flake structure** — `hosts/`, `modules/{system,desktop,hardware,services}/`, `home/{packages,config}/`
- **Desktop apps by category** — creative (Krita, Shotcut), gaming (Steam, Lutris, Bottles), productivity (Obsidian, OnlyOffice)
- **Security hardening** — kernel sysctl lockdown, blacklisted modules, SSH with key-only auth, firewall
- **Virtualization ready** — Docker, libvirt + virt-manager, OVMF

## Quick Start

```bash
# On a fresh NixOS install:
sudo nixos-rebuild switch --flake github:Cedrick-Coto/NixOs-Configuration#nixos
```

For an existing system:

```bash
git clone https://github.com/Cedrick-Coto/NixOs-Configuration.git ~/nix-config
cd ~/nix-config
sudo nixos-rebuild switch --flake .#nixos
home-manager switch --flake .#cedrick
```

## Structure

```
├── flake.nix                      # Entry point (nixpkgs + home-manager)
├── configuration.nix              # Delegates to hosts/
│
├── hosts/
│   └── nixos/                     # Host-specific: hardware + module imports
│       ├── default.nix
│       └── hardware.nix
│
├── modules/
│   ├── system/                    # Core OS: boot, locale, users, network, security
│   ├── desktop/                   # Display: Niri compositor, greetd, XDG portals
│   ├── hardware/                  # AMD GPU, bluetooth
│   └── services/                  # SSH, Flatpak, printing
│
├── home/
│   ├── packages/                  # Apps by category: default, creative, gaming, cli
│   ├── config/                    # User config: shell, git, gtk, nvim
│   └── services.nix               # User services: udiskie, gpg-agent
│
├── nvim/                          # Neovim config (LazyVim + C# toolchain)
│   └── lua/plugins/csharp.lua     # OmniSharp, DAP, neotest, telescope
│
├── templates/                     # Cross-platform .NET project templates
├── wallpapers/                    # Desktop backgrounds
├── overlays/                      # Package overlays
└── secrets/                       # Encrypted secrets (age/sops)
```

## Technologies

| Layer | Choice |
|---|---|
| Distribution | NixOS (unstable) |
| Config system | Flakes + home-manager |
| Compositor | Niri (scrollable-tiling Wayland) |
| Display manager | greetd + tuigreet |
| Editor | Neovim + LazyVim |
| C# toolchain | OmniSharp, netcoredbg, neotest-dotnet |
| Shell | Bash + starship + zoxide + fzf |
| Theme | Catppuccin Mocha (GTK, icons, cursors) |
| Virtualization | Docker, libvirt (KVM/QEMU) |

## Cross-Platform C# Development

This configuration bridges Windows (Visual Studio) and Linux (Neovim) seamlessly:

- **`.editorconfig`** — Roslyn analyzer rules, indent styles, charset — identical on both OS
- **`.gitattributes`** — `* text=auto` lets Git handle CRLF/LF transparently
- **`Directory.Build.props`** — Shared build properties, no platform-specific overrides
- **`.gitignore`** — Ignores OS artifacts, NuGet packages, build output

The result: zero incidental diffs between team members on Windows vs Linux.
