alias ta='tmux attach -t'

alias s='source ~/.zshrc'

alias c="clear"
alias cd="z"
alias dc=cd
alias cat="bat -p"
alias g="glow -p -s dark"

# Take whatever JSON I currently have copied, pretty-print it, and replace the clipboard with the formatted version.
alias jj='pbpaste | jsonpp | pbcopy'
alias rm=trash

alias v='nvim -w ~/.vimlog "$@"'
alias y='yazi'
alias gc='gcloud beta interactive'
alias sw='bash ~/.local/scripts/gcloud-switch-account.sh'


# Chronological Git history view
# Best for daily development, code reviews, and understanding recent activity.
# Preserves graph readability while showing commits mostly in time order.
alias glog="git log --all --graph --decorate=short --date-order \
--pretty=format:'%C(auto)%h%Creset %C(yellow)%d%Creset %s %C(green)(%cr)%Creset %C(blue)<%an>%Creset' \
--abbrev-commit --date=relative"

# Topology-first Git branch tree
# Best for debugging merges, rebases, and understanding branch ancestry.
# Strictly preserves branch topology and merge relationships.
alias gtop="git log --all --graph --decorate=short --topo-order \
--pretty=format:'%C(auto)%h%Creset %C(red)%d%Creset %s %C(green)(%cr)%Creset %C(blue)<%an>%Creset' \
--abbrev-commit --date=relative"


# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# remove broken symlinks
alias clsym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"

alias vi='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

a() {
  if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
  else
    echo "❌ No .venv found"
  fi
}

jlab() {
    local withs=()

    if [[ $# -eq 0 ]]; then
        uv run --with jupyterlab jupyter-lab
        return
    fi

    local target="${@[-1]}"        # último argumento = path
    local libs=("${@[1,-2]}")      # todos los anteriores = librerías

        for lib in "${libs[@]}"; do
            withs+=(--with "$lib")
        done

        uv run --with jupyterlab "${withs[@]}" jupyter-lab "$target"
}

function take {
    mkdir -p $1
    cd $1
}

function weather() {
    curl "http://wttr.in/${1}";
}


copy-line () {
  rg --line-number --no-heading --color=never "${1:-.}" \
    | fzf --delimiter ':' \
          --preview 'bat --color=always --highlight-line {2} {1}' \
    | cut -d: -f3- \
    | sed 's/^[[:space:]]\+//' \
    | pbcopy
}

open-at-line () {
  local selection
  selection=$(rg --line-number --no-heading --color=never "${1:-.}" \
    | fzf --delimiter ':' \
          --preview 'bat --color=always --highlight-line {2} {1}')

  [ -n "$selection" ] || return 0

  local file line
  file=$(printf '%s\n' "$selection" | cut -d: -f1)
  line=$(printf '%s\n' "$selection" | cut -d: -f2)

  vim +"$line" "$file"
}

extract() {
  [[ -f "$1" ]] || { echo "File not found: $1"; return 1; }
  case "$1" in
    *.tar.bz2|*.tbz2) tar -xjf "$1" ;;
    *.tar.gz|*.tgz)   tar -xzf "$1" ;;
    *.tar.xz)         tar -xJf "$1" ;;
    *.tar.zst)        tar --zstd -xf "$1" ;;
    *.tar)            tar -xf "$1" ;;
    *.bz2)            bunzip2 "$1" ;;
    *.gz)             gunzip "$1" ;;
    *.zip)            unzip "$1" ;;
    *.7z)             7z x "$1" ;;
    *.rar)            unrar x "$1" ;;
    *) echo "Unsupported archive format: $1"; return 1 ;;
  esac
}
alias x=extract
