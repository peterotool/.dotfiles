#!/bin/bash

# code --list-extensions

pkglist=(
	arr.marksman
	charliermarsh.ruff
	davidanson.vscode-markdownlint
	github.copilot
	github.copilot-chat
	github.vscode-github-actions
	google.geminicodeassist
	googlecloudtools.cloudcode
	ms-azuretools.vscode-docker
	ms-python.debugpy
	ms-python.python
	ms-python.vscode-pylance
	ms-vscode-remote.remote-containers
	ms-vscode-remote.remote-ssh
	ms-vscode-remote.remote-ssh-edit
	ms-vscode.remote-explorer
	njpwerner.autodocstring
	tamasfe.even-better-toml
	timonwong.shellcheck
	yzhang.markdown-all-in-one
	zainchen.json
)

for i in "${pkglist[@]}"; do
	code --install-extension "$i"
done
