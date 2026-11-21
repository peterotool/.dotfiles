#!/usr/bin/env bash

# ── Productivity & Desktop Apps ──────────────────────────────────────────────
# brew install --cask nikitabobko/tap/aerospace -- https://nikitabobko.github.io/AeroSpace/guide
brew install --cask claude && echo "Anthropic's official Claude desktop app"
brew install --cask obsidian && echo "knowledge base on top of a local folder of Markdown files"
brew install --cask bitwarden && echo "password and login vault"
brew install --cask google-drive && echo "Google Drive storage sync client"
brew install --cask android-file-transfer && echo "transfer files to and from an Android phone"
brew install keycastr && echo "keystroke visualizer for demos and screencasts"

# ── Communication ────────────────────────────────────────────────────────────
brew install --cask discord && echo "voice and text chat"
brew install --cask slack && echo "team communication and collaboration"
brew install --cask zoom && echo "video meetings"
brew install --cask microsoft-teams && echo "Microsoft meetings, chat and collaboration"

# ── Browsers ─────────────────────────────────────────────────────────────────
brew install --cask google-chrome && echo "web browser"

# ── Fonts ────────────────────────────────────────────────────────────────────
brew install --cask font-meslo-lg-nerd-font && echo "Meslo font patched with Nerd Font icons"

# ── Terminal & Shell ─────────────────────────────────────────────────────────
brew install --cask ghostty && echo "GPU-accelerated, platform-native terminal emulator"
brew install tmux && echo "terminal multiplexer"
brew install herdr && echo "agent multiplexer that lives in your terminal"
brew install starship && echo "cross-shell prompt"
brew install zsh-syntax-highlighting && echo "adds syntax coloring to ZSH commands"
brew install zsh-vi-mode && echo "enables Vim-style keybindings in Zsh"

# ── Editors & IDEs ───────────────────────────────────────────────────────────
brew install neovim && echo "Vim fork focused on extensibility"
brew install --cask visual-studio-code && echo "open-source code editor"
brew install --cask zed && echo "fast multiplayer code editor"

# ── Languages, Runtimes & Package Managers ───────────────────────────────────
brew install go && echo "Go programming language"
brew install lua && echo "lightweight scripting language"
brew install node && echo "JavaScript runtime"
brew install python && echo "Python interpreter"
brew install rust && echo "Rust programming language"
brew install oracle-jdk && echo "Java Development Kit from Oracle"
brew install uv && echo "extremely fast Python package and project manager"

# ── Language Servers & Parsers ───────────────────────────────────────────────
brew install lua-language-server && echo "language server for Lua"
brew install tree-sitter-cli && echo "required by nvim-treesitter to install/update parsers"

# ── Code Quality & Formatting ────────────────────────────────────────────────
brew install shfmt && echo "Autoformat shell script source code"
brew install shellcheck && echo "static analysis tool for shell scripts (linter)"
brew install stylua && echo "Code formatter for Lua"
brew install prettier && echo "Code formatter for JavaScript, CSS, JSON, GraphQL, Markdown, YAML"
brew install markdownlint-cli && echo "lints Markdown files for style and consistency"

# ── Git & Version Control ────────────────────────────────────────────────────
brew install gh && echo "interact with GitHub from the command line"
brew install git-delta && echo "syntax-highlighting pager for git and diff output"
brew install forgit && echo "interactive git commands powered by fzf"
brew install tuicr && echo "code review TUI with vim keybindings"
brew install --cask github && echo "GitHub Desktop client"

# ── Cloud, DevOps & Infrastructure ───────────────────────────────────────────
brew install --cask google-cloud-sdk && echo "tools to manage Google Cloud resources"
brew install --cask azure-cli && echo "Microsoft Azure command-line interface"
brew tap hashicorp/tap
brew trust --tap hashicorp/tap && echo "Homebrew 7+ only loads formulae from trusted third-party taps"
brew install hashicorp/tap/terraform && echo "infrastructure as code"
brew install terraform-docs && echo "generates documentation from Terraform modules"
brew tap terraform-linters/tap
brew trust --tap terraform-linters/tap
brew install terraform-linters/tap/tflint && echo "lints and validates Terraform code"
brew install docker && echo "container engine CLI"
brew install docker-compose && echo "multi-container Docker environments"
# brew install helm
# brew install kubernetes-cli
brew install ngrok && echo "secure tunnels to localhost"
brew tap databricks/tap
brew trust --tap databricks/tap
brew install databricks/tap/databricks && echo "Databricks command-line interface"

# ── Databases & API Tools ────────────────────────────────────────────────────
brew install --cask dbeaver-community && echo "universal database tool and SQL client"
# brew install --cask postman
brew install --cask bruno && echo "open-source API explorer and tester"

# ── Search, Navigation & Terminal Utilities ──────────────────────────────────
brew install fzf && echo "interactive fuzzy finder for command-line search"
brew install television && echo "general-purpose fuzzy finder TUI"
brew install fd && echo "simple, fast, user-friendly alternative to find"
brew install ripgrep && echo "fast recursive search tool (grep alternative)"
brew install zoxide && echo "smarter, faster cd command for quick directory jumping"
brew install yazi && echo "fast terminal file manager written in Rust"
brew install bat && echo "cat clone with syntax highlighting and Git integration"
brew install tree && echo "displays directory structures in a tree-like format"
brew install cheat && echo "view and create interactive cheat sheets in the terminal"
brew install watch && echo "runs a command periodically and shows its output"
brew install terminal-notifier && echo "send macOS notifications from the command line"

# ── Data, Text & Files ───────────────────────────────────────────────────────
brew install jq && echo "lightweight and flexible command-line JSON processor"
brew install yq && echo "command-line YAML processor (like jq but for YAML)"
brew install jsonpp && echo "pretty-prints JSON for easier reading"
brew install pandoc && echo "converts between markup and document formats"
brew install glow && echo "renders Markdown in the terminal"
brew install graphviz && echo "graph visualization toolkit (DOT diagrams and dependency graphs)"
brew install sevenzip && echo "7-Zip file archiver with high compression"
brew install trash && echo "safely moves files to the Trash instead of permanent deletion"
brew install wget && echo "downloads files from the web via HTTP, HTTPS, or FTP"
brew install stow && echo "manages dotfiles and symlinked configurations"

# ── Media & Documents ────────────────────────────────────────────────────────
brew install ffmpeg && echo "record, convert, and stream audio and video"
brew install handbrake && echo "open-source video transcoder"
brew install imagemagick && echo "enables SVG, font, HEIC, and JPEG XL previews"
brew install mpv && echo "minimal media player"
brew install poppler && echo "PDF rendering library (for previewing PDFs)"
brew install yt-dlp && echo "downloads videos from YouTube and other sites"

# ── Monitoring & Diagnostics ─────────────────────────────────────────────────
brew install btop && echo "resource monitor (CPU, memory, disks, network)"
brew install htop && echo "interactive process viewer"
brew tap alexsjones/llmfit
brew trust --tap alexsjones/llmfit
brew install alexsjones/llmfit/llmfit && echo "right-sizes LLM models to your system hardware"
