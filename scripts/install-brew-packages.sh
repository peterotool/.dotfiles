#!/usr/bin/env bash

# Desktop & Window Management
# brew install --cask nikitabobko/tap/aerospace -- https://nikitabobko.github.io/AeroSpace/guide

# Passwords & Identity
brew install --cask bitwarden

# Databases & API Tools
brew install --cask dbeaver-community
# brew install --cask postman
brew install --cask bruno

# Fonts
brew install --cask font-meslo-lg-nerd-font

# Terminals & Shell UX
brew install --cask ghostty
brew install antigen && echo "plugin manager for Zsh"
brew install herdr
brew install starship
brew install tmux
brew install zsh-syntax-highlighting && echo "adds syntax coloring to ZSH commands"
brew install zsh-vi-mode && echo "enables Vim-style keybindings in Zsh"

# Editors
brew install neovim
brew install --cask visual-studio-code
brew install --cask zed
brew install --cask obsidian

# Cloud, DevOps & Infrastructure
brew install --cask google-cloud-sdk
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terraform-docs && echo "generates documentation from Terraform modules"
brew install tflint && echo "lints and validates Terraform code"
brew install docker
brew install docker-compose
# brew install helm
# brew install kubernetes-cli
brew install ngrok

# Languages & Language Servers
brew install go
brew install lua
brew install node
brew install python
brew install rust
brew install tree-sitter-cli && echo "required by nvim-treesitter to install/update parsers"
brew install lua-language-server
brew install oracle-jdk

# Package Management
brew install uv

# Code Quality & Formatting
brew install shfmt && echo "Autoformat shell script source code"
brew install stylua && echo "Code formatter for Lua"
brew install markdownlint-cli && echo "lints Markdown files for style and consistency"
brew install prettier && echo "Code formatter for JavaScript, CSS, JSON, GraphQL, Markdown, YAML"
brew install shellcheck && echo "static analysis tool for shell scripts (linter)"

# Git & Version Control
brew install gh && echo "interact with GitHub from the command line"
brew install git-delta && echo "syntax-highlighting pager for git and diff output"
brew install --cask github

# Search, Navigation & Terminal Utilities
brew install bat && echo "cat clone with syntax highlighting and Git integration"
brew install cheat && echo "view and create interactive cheat sheets in the terminal"
brew install fd && echo "simple, fast, user-friendly alternative to find"
brew install television
brew install fzf && echo "interactive fuzzy finder for command-line search"
brew install ripgrep && echo "fast recursive search tool (grep alternative)"
brew install tree && echo "displays directory structures in a tree-like format"
brew install zoxide && echo "smarter, faster cd command for quick directory jumping"
brew install yazi && echo "fast terminal file manager written in Rust"

# Data, Text & Files
brew install jq && echo "lightweight and flexible command-line JSON processor"
brew install yq && echo "command-line YAML processor (like jq but for YAML)"
brew install jsonpp && echo "pretty-prints JSON for easier reading"
brew install pandoc
brew install glow
brew install graphviz && echo "graph visualization toolkit (DOT diagrams and dependency graphs)"
brew install stow && echo "manages dotfiles and symlinked configurations"
brew install trash && echo "safely moves files to the Trash instead of permanent deletion"
brew install wget && echo "downloads files from the web via HTTP, HTTPS, or FTP"

# Media & Documents
brew install ffmpeg && echo "record, convert, and stream audio and video"
brew install handbrake
brew install imagemagick && echo "enables SVG, font, HEIC, and JPEG XL previews"
brew install mpv
brew install poppler && echo "PDF rendering library (for previewing PDFs)"
brew install yt-dlp && echo "downloads videos from YouTube and other sites"

# Monitoring & Diagnostics
brew install htop
brew install watch
brew install keycastr
brew install terminal-notifier

# Communication
brew install --cask discord
brew install --cask slack
brew install --cask zoom

# Storage & Sync
brew install --cask google-drive

# Browsers
brew install --cask google-chrome
