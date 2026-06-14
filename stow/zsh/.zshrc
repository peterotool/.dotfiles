# plugins / antigen
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# https://zenzes.me/mastering-your-zsh-configuration-with-antigen-and-oh-my-zsh/
source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# load plugins
antigen bundle extract
antigen apply

# load env (variables)
source $HOME/.zsh_profile

# aliases / history
source $HOME/aliases.zsh
source $HOME/history.zsh

# PATH helpers
addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

# rust binaries
addToPathFront "$HOME/.cargo/bin"
# ruff
addToPathFront "$HOME/.local/bin"


# completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


# misc autoloads
autoload -U zmv
autoload -U promptinit && promptinit
autoload -U colors && colors

# syntax highlighting (SIEMPRE después de compinit)
if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# cloud / k8s
if [ $commands[gcloud] ]; then source $(brew --prefix)/share/google-cloud-sdk/path.zsh.inc; fi
if [ $commands[gcloud] ]; then source $(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc; fi
if [ $commands[helm] ]; then source <(helm completion zsh); fi
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# uv completion
_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files -g "*.py"'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv

# Added by codeen install
export PATH="/Users/peter/.local/bin/codeen:$PATH"

eval "$(starship init zsh)"

export CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1
eval "$(tv init zsh)"
# IMPORTANT: must be the last thing
eval "$(zoxide init zsh)"
