#!/bin/bash

# code --list-extensions

pkglist=(
	arr.marksman
	charliermarsh.ruff
	continue.continue
	davidanson.vscode-markdownlint
	docker.docker
	github.copilot
	github.copilot-chat
	github.vscode-github-actions
	gitlab.gitlab-workflow
	google.geminicodeassist
	googlecloudtools.cloudcode
	hashicorp.terraform
	ms-azuretools.vscode-containers
	ms-azuretools.vscode-docker
	ms-python.debugpy
	ms-python.python
	ms-python.vscode-pylance
	ms-python.vscode-python-envs
	ms-toolsai.jupyter
	ms-toolsai.jupyter-keymap
	ms-toolsai.jupyter-renderers
	ms-toolsai.vscode-jupyter-cell-tags
	ms-toolsai.vscode-jupyter-slideshow
	ms-vscode-remote.remote-containers
	ms-vscode-remote.remote-ssh
	ms-vscode-remote.remote-ssh-edit
	ms-vscode.remote-explorer
	njpwerner.autodocstring
	tamasfe.even-better-toml
	timonwong.shellcheck
	vscodevim.vim
	vstirbu.vscode-mermaid-preview
	yzhang.markdown-all-in-one
	zainchen.json
)

for i in "${pkglist[@]}"; do
	code --install-extension "$i"
done
