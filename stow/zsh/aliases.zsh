alias pip="uv pip"

alias t='tmux'
alias ta='tmux attach -t'
alias tns='tmux new -s'
alias tl='tmux list-sessions'

alias s='source ~/.zshrc'

alias c="clear"
alias cd="z"
alias dc=cd
alias cat="bat -p"

alias jj='pbpaste | jsonpp | pbcopy'
alias rm=trash

alias v='nvim -w ~/.vimlog "$@"'
alias y='yazi'
alias gc='gcloud beta interactive'
alias sw='bash ~/.local/scripts/gcloud-switch-account.sh'

alias log="git log --all  --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias wlog="watch git log --all  --graph --abbrev-commit --date=relative"


# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
# remove broken symlinks
alias clsym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"

function take {
    mkdir -p $1
    cd $1
}

function weather() {
    curl "http://wttr.in/${1}";
}

alias moon="curl 'http://wttr.in/Moon'"


# FZF ---------------------------------------------------------------------

alias vi='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

# https://www.youtube.com/watch?v=Sh-fJWB9xpw
copy-line () {
  rg --line-number "${1:-.}" | sk --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print $3}' | sed 's/^\s+//' | pbcopy
}

open-at-line () {
  vim $(rg --line-number "${1:-.}" | sk --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2" "$1}')
}
