#!/usr/bin/env bash

stow_dotfiles() {
    # Individual files that will be symlinked directly into $HOME.
    # These are removed and re-created as symlinks on each run.
    local files=(
        ".claude.json"
        ".config/starship.toml"
        ".editorconfig"
        ".gcloud-switch-account.sh"
        ".gitconfig"
        ".gitconfig-bitbucket"
        ".gitconfig-github"
        ".gitconfig-gitlab"
        ".markdownlint.jsonc"
        ".tmux-cht-command"
        ".tmux-cht-languages"
        ".tmux.conf"
        ".zprofile"
        ".zsh_profile"
        ".zshrc"
        "Library/Application Support/Code/User/settings.json"
        "aliases.zsh"
        "history.zsh"
    )

    # Directories that must exist before stow runs.
    # Pre-creating them forces stow to symlink individual files inside rather
    # than symlinking the whole directory, which would prevent adding new files
    # to the package without re-stowing.
    local folders=(
        ".config/alacritty"
        ".config/codeen"
        ".config/editorconfig"
        ".config/fd"
        ".config/ghostty"
        ".config/git"
        ".config/herdr"
        ".config/markdownlint"
        ".config/nvim"
        ".config/ripgrep"
        ".config/ruff"
        ".config/television"
        ".config/yazi"
        ".config/zed"
        ".local/scripts"
        ".tmux/plugins"
    )

    # Remove existing files so stow doesn't refuse to overwrite them.
    # -f suppresses errors for files that don't exist yet.
    # [@] expands the array to all its elements, each as a separate quoted word,
    # so filenames with spaces are handled safely.
    for f in "${files[@]}"; do
        rm -f "$HOME/$f"
    done

    # Wipe and recreate each target directory.
    # ${HOME:?} causes the script to abort if $HOME is unset, preventing
    # an accidental `rm -rf /` if the variable is empty.
    # Same [@] expansion for the folders array.
    for d in "${folders[@]}"; do
        rm -rf "${HOME:?}/$d"
        mkdir -p "$HOME/$d"
    done

    # Common stow flags shared by every package:
    #   --dir stow      — treat the local `stow/` directory as the stow root
    #   --verbose 1     — print each symlink as it is created
    #   --target $HOME  — create symlinks in the user's home directory
    local stow_args=(--dir stow --verbose 1 --target "$HOME")

    # Iterate over every subdirectory of stow/ using a glob.
    # `stow/*/` expands to paths like `stow/zsh/`; stripping the trailing
    # slash and the leading `stow/` leaves just the package name (e.g. `zsh`).
    # vscode is skipped here because it targets a different directory below.
    for dir in stow/*/; do
        local folder="${dir%/}" # strip trailing slash: stow/zsh/ → stow/zsh
        folder="${folder##*/}"  # strip leading path:   stow/zsh  → zsh
        [[ "$folder" == "vscode" ]] && continue
        stow "${stow_args[@]}" "$folder" # [@] spreads the array as separate args to stow
    done

    # vscode config lives outside $HOME, so it needs its own target path.
    stow --dir "$HOME/.dotfiles/stow" --target "$HOME/Library/Application Support/Code/User" vscode
}
