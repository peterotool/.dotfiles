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

stow_dotfiles() {
	local files=(
		# ".aliases"
		".config/starship.toml"
		".gitconfig"
		# ".jq"
		# ".profile*"
		".zshrc"
		".zprofile"
		"aliases.zsh"
		"history.zsh"
		".tmux.conf"
		".tmux-cht-command"
		".tmux-cht-languages"
	)
	local folders=(
		".config/fd"
		".config/git"
		".config/alacritty"
		".config/nvim"
		".tmux/plugins"
		".local/scripts"
		".local/share/zsh/completions"
		# ".ssh" # important
	)
	info "Removing existing config files"
	for f in "${files[@]}"; do
		rm -f "$HOME/$f" || true
	done

	# Create the folders to avoid symlinking folders
	for d in "${folders[@]}"; do
		rm -rf "${HOME:?}/$d" || true
		mkdir -p "$HOME/$d"
	done

	# shellcheck disable=SC2155
	local STOW_FOLDERS="$(find stow -maxdepth 1 -type d -mindepth 1 | awk -F "/" '{print $NF}' ORS=' ')"
	info "Stowing: $STOW_FOLDERS"

	for folder in $(echo $STOW_FOLDERS)
	do
		stow -d stow --verbose 1 --target "$HOME" "$folder"
	done

	# set permissions
	# chmod a+x ~/.git-templates/hooks/pre-commit
}