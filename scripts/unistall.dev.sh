#!/bin/bash
# Script to uninstall project dev environment setup

set -e

echo "=== Uninstalling TinyTeX and related configurations ==="
tlmgr path remove
rm -r ~/.TinyTeX

# Limpiar PATH en ~/.profile
if grep -q 'TinyTeX/bin/x86_64-linux' ~/.profile 2>/dev/null; then
    sed -i '/TinyTeX\/bin\/x86_64-linux/d' ~/.profile
    echo "Línea de TinyTeX eliminada de ~/.profile"
fi

# Eliminar tex-fmt si fue instalado con cargo
if command -v cargo &>/dev/null && cargo install --list | grep -q '^tex-fmt '; then
    cargo uninstall tex-fmt
    echo "tex-fmt desinstalado con cargo"
fi

# Eliminar extensiones recomendadas de VS Code (opcional)
# if command -v code &>/dev/null; then
#     code --uninstall-extension James-Yu.latex-workshop || true
#     code --uninstall-extension streetsidesoftware.code-spell-checker || true
#     echo "Extensiones de LaTeX y spell checker desinstaladas de VS Code"
# fi

# Eliminar Taskfile CLI si fue instalado con npm
# if command -v npm &>/dev/null && npm list -g @go-task/cli &>/dev/null; then
#     npm uninstall -g @go-task/cli
#     echo "Taskfile CLI desinstalado"
# fi

echo "=== Desinstalación completada. ==="
