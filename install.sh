#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. scripts/config.sh
# . scripts/osx.sh

main() {
    echo "Stowing dotfiles..."
    stow_dotfiles

    echo "Adding Git submodules"
    git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
        while read path_key local_path; do
            name=$(echo "$path_key" | sed 's/submodule\.\(.*\)\.path/\1/')
            if git config --get "submodule.$name.url" > /dev/null 2>&1; then
                echo "Submodule '$name' already registered, skipping..."
                continue
            fi
            url_key=$(echo "$path_key" | sed 's/\.path/.url/')
            url=$(git config -f .gitmodules --get "$url_key")
            git submodule add "$url" "$local_path"
        done

}

main
