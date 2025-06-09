#!/bin/bash
# Script to re-use the basic instllaction steps for latex engine and dependencies

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

    # Change mirror to avoid issues with the default CTAN mirror
    tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet
fi

export PATH="$HOME/.TinyTeX/bin/x86_64-linux:$PATH"

echo "=== Installing required LaTeX packages ==="
if [ -f latex-packages.txt ]; then
    # Read LaTex packages, ignore empty lines and comments.
    PKGS=$(grep -v '^\s*$' latex-packages.txt | grep -v '^#' | tr '\n' ' ')
    tlmgr install $PKGS
else
    echo "Error: latex-packages.txt not found!"
    exit 1
fi
tlmgr path add # If the package contains excecutable, the add them to PATH
echo "=== Basic LaTeX installation completed. ==="
