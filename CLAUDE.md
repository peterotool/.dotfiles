# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal macOS dotfiles managed with **GNU Stow**. Each directory under `stow/` is a Stow package whose contents mirror `$HOME`. Running `stow --dir stow --target "$HOME" <package>` creates symlinks from `$HOME` into the package.

## Key scripts

| Script | Purpose |
|--------|---------|
| `dotfiles.sh` | Bootstrap a new machine: installs Xcode CLT, Homebrew, git, clones the repo, runs `install.sh` |
| `install.sh` | Stows all packages and initializes git submodules |
| `scripts/config.sh` | Defines `stow_dotfiles()` — the function that removes existing files/folders and runs `stow` for each package |
| `scripts/install-brew-packages.sh` | Installs all Homebrew formulae and casks (run manually) |

### To apply dotfiles on an existing machine

```bash
./install.sh
```

### To bootstrap a brand-new machine

```bash
bash dotfiles.sh
```

## Stow packages

Each subdirectory of `stow/` maps to a tool's config:

- `zsh/` — `.zshrc`, `.zsh_profile`, `aliases.zsh`, `history.zsh`
- `git/` — `.gitconfig`, `.config/git/ignore` (uses `delta` as pager)
- `tmux/` — `.tmux.conf` + tpm submodule at `.tmux/plugins/tpm`
- `nvim/` — submodule pointing to `git@github.com:peterotool/nvim.git`
- `alacritty/` — catppuccin theme submodule
- `scripts/` — custom shell scripts installed to `~/.local/scripts/`
- `zed/`, `ghostty/`, `starship/`, `yazi/`, `vscode/`, `ruff/`, `fd/`, `ripgrep/`

`vscode/` is special: stowed into `~/Library/Application Support/Code/User` instead of `$HOME`.

## Git submodules

Three submodules tracked in `.gitmodules`:
- `stow/nvim/.config/nvim` — Neovim config (SSH remote)
- `stow/tmux/.tmux/plugins/tpm` — Tmux Plugin Manager
- `stow/alacritty/.config/alacritty/catppuccin` — Alacritty theme

After cloning, initialize with:
```bash
git submodule update --init --recursive
```

## Shell environment conventions

- Shell: **zsh** with antigen + oh-my-zsh, `zsh-vi-mode`, `zsh-syntax-highlighting`
- Prompt: **Starship**
- `cd` is aliased to `zoxide` (`z`)
- `cat` is aliased to `bat -p`
- `rm` is aliased to `trash` (safe delete)
- `v` opens nvim with a vimlog; `vi` opens fzf → nvim picker
- `y` launches yazi
- Tmux prefix: `C-a` (remapped from `C-b`)
- Pane navigation: `C-h/j/k/l` (vim-aware, works across nvim splits)
- Editor/Visual: `nvim`; `MANPAGER='nvim +Man!'`

## Shell linting

Scripts use `shellcheck` and are formatted with `shfmt`. Both are installed via Homebrew.

```bash
shellcheck scripts/config.sh
shfmt -w scripts/config.sh
```
