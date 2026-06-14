#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. scripts/config.sh
# . scripts/osx.sh

# setup_github_ssh() {
# 	if [ -z "${SSH_PASSPHRASE}" ]; then
# 		echo "SSH_PASSPHRASE not set"
# 	else
# 		info "Using $SSH_PASSPHRASE"
# 		ssh-keygen -t ed25519 -C "$SSH_PASSPHRASE"

# 		info "Adding ssh key to keychain"
# 		ssh-add -K ~/.ssh/id_ed25519

# 		info "Remember add ssh key to github account 'pbcopy < ~/.ssh/id_ed25519.pub'"
# 	fi
# }

main() {
    echo "Stowing dotfiles..."
    stow_dotfiles

    echo "Adding Git submodules"
    # Get All Submodule Paths
    git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
        # Loop Through Each Submodule
        while read path_key local_path; do
            # Construct URL Key for Submodule
            url_key=$(echo $path_key | sed 's/\.path/.url/')
            # Retrieve the Submodule's URL
            url=$(git config -f .gitmodules --get "$url_key")
            # Add the Submodule
            git submodule add $url $local_path
        done

}

main
