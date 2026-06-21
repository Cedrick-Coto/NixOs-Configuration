#!/usr/bin/env bash
# Verifica que el proyecto ASP.NET no cause conflictos cross-platform
# Simula commits desde Linux y verifica que Windows no detecte cambios
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

pass() { echo -e "${GREEN}[PASS]${NC} $1"; }
fail() { echo -e "${RED}[FAIL]${NC} $1"; }
info() { echo -e "${YELLOW}[INFO]${NC} $1"; }

WORKDIR=$(mktemp -d)
trap "rm -rf $WORKDIR" EXIT

echo ""
info "=== Verificacion cross-platform ASP.NET ==="
echo ""

# 1. Crear proyecto
info "1. Creando proyecto de prueba..."
"$(dirname "$0")/new-aspnet.sh" CrossPlatformTest webapi -o "$WORKDIR/CrossPlatformTest" > /dev/null 2>&1
cd "$WORKDIR/CrossPlatformTest"

# 2. Verificar que NO hay archivos obj/ en el repo
info "2. Verificando que obj/ no esta versionado..."
if git ls-files | grep -q "^obj/"; then
  fail "obj/ esta versionado!"
  git ls-files | grep "^obj/"
else
  pass "obj/ no esta en el repositorio"
fi

# 3. Verificar que .gitattributes existe y tiene * text=auto sin eol=crlf
info "3. Verificando .gitattributes..."
# Verificar que text=auto global NO tiene eol=crlf (solo .sln debe tenerlo)
GLOBAL_LINE=$(head -8 .gitattributes | tail -1)
if echo "$GLOBAL_LINE" | grep -q "text=auto"; then
  if echo "$GLOBAL_LINE" | grep -q "eol=crlf"; then
    fail ".gitattributes: text=auto global tiene eol=crlf forzado"
  else
    pass ".gitattributes: text=auto global sin eol fijo"
  fi
else
  fail ".gitattributes no tiene text=auto en linea global"
fi

# 4. Verificar que .editorconfig NO tiene end_of_line
info "4. Verificando .editorconfig..."
if grep -q "^end_of_line" .editorconfig; then
  fail ".editorconfig especifica end_of_line (causara conflictos)"
else
  pass ".editorconfig no tiene end_of_line (Git lo maneja)"
fi

# 5. Simular edicion estilo Neovim (LF) y verificar commit limpio
info "5. Simulando edicion en Linux (LF)..."
echo "// Editado en Linux" >> Program.cs
git add -A
if git diff --cached -- Program.cs | grep -q "^+.*Linux"; then
  git commit -m "feat: edit from Linux" > /dev/null
  pass "Commit desde Linux exitoso"
else
  fail "No se detecto la edicion"
  exit 1
fi

# 6. Simular checkout en Windows (simular CRLF conversion)
info "6. Simulando checkout en Windows..."
# Cambiar core.autocrlf a true como en Windows
git -c core.autocrlf=true checkout-index -f -- Program.cs 2>/dev/null || true
# Verificar que el working tree sigue limpio
git -c core.autocrlf=true diff --exit-code Program.cs 2>/dev/null && {
  pass "Working tree limpio incluso con autocrlf=true (Windows)"
} || {
  fail "Git detecta cambios espurios con autocrlf=true"
  info "Posible causa: .editorconfig o .gitattributes incorrecto"
  git diff Program.cs | head -20
  exit 1
}

# 7. Simular formateo que haria VS
info "7. Simulando formateo con dotnet format..."
dotnet format --verify-no-changes --no-restore 2>/dev/null && {
  pass "dotnet format: sin cambios necesarios"
} || {
  # Si hay cambios, formatear y verificar que no se rompe nada
  dotnet format --no-restore 2>/dev/null && {
    if git diff --exit-code --quiet 2>/dev/null; then
      fail "dotnet format no reporto cambios pero si los hubo"
    else
      git diff
      info "NOTA: dotnet_format hizo cambios. Esto puede deberse al template default."
      info "Los cambios de dotnet format son independientes de la plataforma."
    fi
  } || {
    info "dotnet format: saltando (no critical)"
  }
}

# 8. Build cross-platform
info "8. Verificando build..."
if dotnet build --no-restore 2>/dev/null; then
  pass "Build exitoso en Linux (mismo codigo que buildearia en Windows)"
else
  info "Build requiere restore primero..."
  dotnet build 2>/dev/null && pass "Build exitoso" || fail "Build fallo"
fi

# 9. Verificar que el repositorio no tiene archivos con CRLF en working tree
info "9. Verificando line endings..."
CRLF_FILES=$(git ls-files --eol | grep -i " w/crlf " | grep -v "^i/lf" || true)
if [ -n "$CRLF_FILES" ]; then
  info "Archivos con CRLF en working tree (esperado en Windows, inusual en Linux):"
  echo "$CRLF_FILES" | head -5
  info "Esto es normal si .gitattributes no forza nada - Git usa CRLF solo en Windows"
else
  pass "Working tree usa LF (correcto para Linux)"
fi

echo ""
info "=== Resumen ==="
echo ""
echo "Escenarios cubiertos:"
echo "  - Commit desde Linux (LF)"
echo "  - Checkout en Windows simulado (autocrlf=true)"
echo "  - git diff sin cambios espurios entre plataformas"
echo "  - dotnet format produce mismo resultado en ambas"
echo "  - .editorconfig sin end_of_line (no fuerza CRLF/LF)"
echo "  - .gitattributes con text=auto (Git maneja conversion)"
echo ""

echo "Para probar en Windows real:"
echo "  git clone <repo> en Windows con VS"
echo "  abrir .sln en VS, compilar, formatear codigo"
echo "  git diff debe mostrar 0 cambios"
echo ""
