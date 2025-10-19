source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# https://zenzes.me/mastering-your-zsh-configuration-with-antigen-and-oh-my-zsh/
source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# load plugins
# antigen bundle git
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zdharma-continuum/fast-syntax-highlighting
# antigen bundle git
# antigen bundle git-prompt
# antigen bundle vi-mode
# antigen bundle docker-compose
antigen bundle extract
# antigen bundle colored-man-pages
# antigen bundle colorize
# antigen bundle git
# antigen bundle fzf  
# antigen bundle ag
# antigen bundle gcloud
# 
# # Other bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done
antigen apply

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

# rust binaries
addToPathFront "$HOME/.cargo/bin"

# ruff
addToPathFront "$HOME/.local/bin"

source $HOME/.zsh_profile
source $HOME/aliases.zsh
source $HOME/history.zsh
