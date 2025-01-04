#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. scripts/utils.sh
. scripts/config2.sh
# . scripts/osx.sh

cleanup() {
	err "Last command failed"
	info "Finishing..."
}

main() {
	info "Installing ..."
	stow_dotfiles
	success "Finished stowing dotfiles"

	# Update Git submodules with dynamic branch detection
	info "Adding Git submodules..."

	# git submodule init
	# git submodule update --recursive --remote
	# make git pull from the HEAD remote branch, it coukd be (main) or (master)
	# git submodule foreach --recursive bash -c 'default_branch=$(git remote show origin | grep "HEAD branch" | cut -d" " -f5); git pull origin $default_branch'

	# success "Git submodules added successfully"

	# info "################################################################################"
	# info "SSH Key"
	# info "################################################################################"
	# setup_github_ssh
	# success "Finished setting up SSH Key"

	# success "Done"

	# 	info "System needs to restart. Restart?"

	# 	select yn in "y" "n"; do
	# 		case $yn in
	# 		y)
	# 			sudo shutdown -r now
	# 			break
	# 			;;
	# 		n) exit ;;
	# 		esac
	# 	done
}

# trap cleanup SIGINT SIGTERM ERR EXIT

main

