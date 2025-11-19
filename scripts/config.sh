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
		".config/yazi"
		".tmux/plugins"
		".local/scripts"
		# ".ssh" # important
	)
	info "Removing existing config files"
	for f in "${files[@]}"; do
		rm -f "$HOME/$f" || true
	done

	info "Create the folders to avoid symlinking folders"
	for d in "${folders[@]}"; do
		rm -rf "${HOME:?}/$d" || true
		mkdir -p "$HOME/$d"
	done

	# shellcheck disable=SC2155
	local STOW_FOLDERS="$(find stow -maxdepth 1 -type d -mindepth 1 | awk -F "/" '{print $NF}' ORS=' ')"
	info "Stowing: $STOW_FOLDERS"

	for folder in $STOW_FOLDERS; do
		if [[ "$folder" == "vscode" ]]; then
			echo "Skipping folder: $folder"
			continue
		fi
		stow -d stow --verbose 1 --target "$HOME" "$folder"
	done

	# VSCODE

	# -d "$HOME/.dotfiles/stow" → Specifies the directory containing Stow packages (vscode in this case).
	# -t "$HOME/Library/Application Support/Code/User" → Sets the target directory where symlinks should be created.
	# vscode → The package name (a subdirectory inside stow/).
	stow -d "$HOME/.dotfiles/stow" -t "$HOME/Library/Application Support/Code/User" vscode

	# set permissions
	# chmod a+x ~/.git-templates/hooks/pre-commit
}
