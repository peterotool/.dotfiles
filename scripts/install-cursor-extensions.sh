#!/bin/bash

# cursor --list-extensions

pkglist=(
	anysphere.pyright
	arr.marksman
	charliermarsh.ruff
	davidanson.vscode-markdownlint
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
	zainchen.json
)

for i in "${pkglist[@]}"; do
	cursor --install-extension "$i"
done
