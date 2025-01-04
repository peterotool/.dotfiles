#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

stow home  --target="$HOME/"
stow config --target="$HOME/.config"
mkdir -p "$HOME/.local/scripts"
stow scripts  --target="$HOME/.local/scripts"
stow vscode  --target="$HOME/Library/Application Support/Code/User"