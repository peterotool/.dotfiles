#!/usr/bin/env bash

stow_dotfiles() {
    local files=(
        ".gitconfig"
        ".config/starship.toml"
        ".tmux.conf"
        ".tmux-cht-command"
        ".tmux-cht-languages"
        ".gcloud-switch-account.sh"
        ".zprofile"
        ".zsh_profile"
        ".zshrc"
        "aliases.zsh"
        "history.zsh"
        ".editorconfig"
        "Library/Application Support/Code/User/settings.json" # vscode
    )
    local folders=(
        ".config/fd"
        ".config/git"
        ".config/ripgrep"
        ".config/alacritty"
        ".config/ghostty"
        ".config/nvim"
        ".config/ruff"
        ".config/zed"
        ".config/yazi"
        ".config/editorconfig"
        ".tmux/plugins"
        ".local/scripts"
        # ".ssh" # important
    )
    # Removing existing config files
    for f in "${files[@]}"; do
        rm -f "$HOME/$f" || true
    done

    # Create the folders to avoid symlinking folders
    for d in "${folders[@]}"; do
        rm -rf "${HOME:?}/$d" || true
        mkdir -p "$HOME/$d"
    done

    local STOW_FOLDERS="$(find stow -maxdepth 1 -type d -mindepth 1 | awk -F "/" '{print $NF}' ORS=' ')"
    echo "Stowing: $STOW_FOLDERS"

    for folder in $STOW_FOLDERS; do
        if [[ "$folder" == "vscode" ]]; then
            echo "Skipping folder: $folder"
            continue
        fi
        stow --dir stow --verbose 1 --target "$HOME" "$folder"
    done

    stow --dir "$HOME/.dotfiles/stow" --target "$HOME/Library/Application Support/Code/User" vscode
    # set permissions
    # chmod a+x ~/.git-templates/hooks/pre-commit
}
