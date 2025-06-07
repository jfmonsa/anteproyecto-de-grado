#!/bin/bash

set -e

echo "=== Checking basic dependencies ==="
for cmd in perl wget; do
    if ! command -v $cmd &>/dev/null; then
        echo "Error: $cmd is not installed. Install it and try again."
        exit 1
    fi
done

echo "=== Installing TinyTeX if necessary ==="
if ! command -v tlmgr &>/dev/null; then
    wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh
    export PATH="$HOME/bin:$PATH"
fi

export PATH="$HOME/.TinyTeX/bin/x86_64-linux:$PATH"
if ! grep -q 'TinyTeX/bin/x86_64-linux' ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.TinyTeX/bin/x86_64-linux:$PATH"' >> ~/.zshrc
    echo "Added TinyTeX bin to PATH in ~/.zshrc"
fi

echo "=== Installing required LaTeX packages ==="
tlmgr install babel-spanish colortbl pdflscape caption biblatex biblatex-ieee tocbibind subfig enumitem pbox anysize csquotes chktex biber


echo "=== Installing tex-fmt (LaTex formatter written in rust) ==="
if ! command -v tex-fmt &>/dev/null; then
    if command -v cargo &>/dev/null; then
        cargo install tex-fmt
    else
        echo "Error: cargo is not installed. Please install Rust and Cargo first."
        exit 1
    fi
fi

# Recommended editor setup
echo "=== Installing LaTeX Workshop extension for VS Code ==="
if command -v code &>/dev/null; then
    code --install-extension James-Yu.latex-workshop --force
else
    echo "Warning: VS Code (code) command not found. Skipping LaTeX Workshop extension installation."
fi

echo "=== Buscando el archivo .tex en la raíz ==="
TEXFILE=$(find . -maxdepth 1 -type f -name "*.tex" | head -n 1)

if [[ -z "$TEXFILE" ]]; then
    echo "Error: No se encontró ningún archivo .tex en la raíz."
    exit 1
fi

echo "=== Compilando el documento LaTeX: $TEXFILE ==="
if command -v latexmk &>/dev/null; then
    latexmk -pdf "$TEXFILE"
else
    BASENAME="${TEXFILE%.tex}"
    pdflatex "$TEXFILE"
    bibtex "${BASENAME}.aux" || true
    pdflatex "$TEXFILE"
    pdflatex "$TEXFILE"
fi

echo "=== Listo. Proyecto inicializado exitosamente. ==="

