#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. scripts/utils.sh
. scripts/config.sh
# . scripts/osx.sh


cleanup() {
	err "Last command failed"
	info "Finishing..."
}

main() {
	info "Installing ..."
	stow_dotfiles
	success "Finished stowing dotfiles"

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