#!/usr/bin/env bash
# Crea un proyecto ASP.NET Core listo para desarrollo cross-platform
# Compatible con Visual Studio (Windows) y Neovim (Linux/Mac)
set -euo pipefail

TEMPLATES_DIR="$(cd "$(dirname "$0")" && pwd)"

show_help() {
  cat <<EOF
Uso: new-aspnet.sh <nombre-proyecto> [tipo] [opciones]

Tipos disponibles:
  webapi       - ASP.NET Core Web API (default)
  webapp       - ASP.NET Core Web App (Razor Pages)
  mvc          - ASP.NET Core MVC
  blazor       - Blazor Server
  blazorwasm   - Blazor WebAssembly
  web          - ASP.NET Core Vacio
  webapiaot    - Web API con Native AOT

Opciones:
  -o, --output <dir>   Directorio de salida (default: ./<nombre-proyecto>)
  -h, --help           Muestra esta ayuda

Ejemplo:
  new-aspnet.sh MiApi webapi
  new-aspnet.sh MiApp webapp -o ./src/MiApp
EOF
  exit 0
}

if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  show_help
fi

PROJECT_NAME="$1"
shift
TEMPLATE="${1:-webapi}"
if [[ "$TEMPLATE" == -* ]]; then
  TEMPLATE="webapi"
else
  shift
fi

OUTPUT_DIR=""
while [ $# -gt 0 ]; do
  case "$1" in
    -o|--output) OUTPUT_DIR="$2"; shift 2 ;;
    *) echo "Opción desconocida: $1"; exit 1 ;;
  esac
done

if [ -z "$OUTPUT_DIR" ]; then
  OUTPUT_DIR="./$PROJECT_NAME"
fi

echo "=== Creando proyecto ASP.NET Core: $PROJECT_NAME ==="
echo "Template: $TEMPLATE"
echo "Directorio: $OUTPUT_DIR"
echo ""

# Crear el proyecto .NET
dotnet new "$TEMPLATE" -n "$PROJECT_NAME" -o "$OUTPUT_DIR" --no-https false

# Copiar archivos de configuracion cross-platform
echo ""
echo "=== Agregando configuracion cross-platform ==="
cp "$TEMPLATES_DIR/.editorconfig" "$OUTPUT_DIR/.editorconfig"
cp "$TEMPLATES_DIR/.gitattributes" "$OUTPUT_DIR/.gitattributes"
cp "$TEMPLATES_DIR/global.json" "$OUTPUT_DIR/global.json"
cp "$TEMPLATES_DIR/Directory.Build.props" "$OUTPUT_DIR/Directory.Build.props"
cp "$TEMPLATES_DIR/.gitignore" "$OUTPUT_DIR/.gitignore"

# Limpiar obj/ del scaffold inicial (no debe versionarse)
rm -rf "$OUTPUT_DIR/obj/"

# Inicializar git
if [ ! -d "$OUTPUT_DIR/.git" ]; then
  echo ""
  echo "=== Inicializando repositorio git ==="
  git -C "$OUTPUT_DIR" init
  git -C "$OUTPUT_DIR" add -A
  git -C "$OUTPUT_DIR" commit -m "Initial scaffold: $PROJECT_NAME ($TEMPLATE)" --allow-empty
fi

echo ""
echo "=== Proyecto creado exitosamente ==="
echo ""
echo "Para abrir en Neovim:"
echo "  cd $OUTPUT_DIR && nvim ."
echo ""
echo "Para abrir en Visual Studio:"
echo "  Abre $OUTPUT_DIR/$PROJECT_NAME.sln o la carpeta directamente"
echo ""
echo "Notas cross-platform:"
echo "  - .editorconfig asegura formato consistente entre VS y Neovim"
echo "  - .gitattributes maneja CRLF/LF automaticamente"
echo "  - Directory.Build.props unifica configuracion de build"
echo "  - global.json fija la version del SDK"
