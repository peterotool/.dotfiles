#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. utils/helper.sh

cleanup() {
	
	local src_dir="$HOME/.dotfiles/home"

    find "$src_dir" -type f | while read -r file; do

        local base_file
        base_file=$(basename "$file")
        local target="$HOME/$base_file"

        if [ -f "$target" ]; then
            echo "Removing: $target"
            rm -f "$target"
        fi
    done

	local scripts_dir="$HOME/.dotfiles/scripts"

    find "$scripts_dir" -type f | while read -r file; do

        local base_file
        base_file=$(basename "$file")
        local target="$HOME/.local/scripts/$base_file"

        if [ -f "$target" ]; then
            echo "Removing: $target"
            rm -f "$target"
        fi
    done

	local specific_files=(
		"Library/Application Support/Code/User/settings.json"
		".config/starship.toml"
	)

	for f in "${specific_files[@]}"; do
		echo "Removing: $f"
		rm -f "$HOME/$f" || true
	done

	info "Cleanup completed"
}

main() {
    info "Installing ..."
    stow home  --target="$HOME/"
    stow config --target="$HOME/.config"
    mkdir -p "$HOME/.local/scripts"
    stow scripts  --target="$HOME/.local/scripts"
    stow vscode  --target="$HOME/Library/Application Support/Code/User"
    success "Finished stowing dotfiles"
}

cleanup
main

