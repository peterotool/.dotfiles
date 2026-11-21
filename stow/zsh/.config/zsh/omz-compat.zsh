# Subset of oh-my-zsh lib/ (completion, directories, misc, theme-and-appearance)
# kept after dropping antigen. https://github.com/ohmyzsh/ohmyzsh/tree/master/lib
# Must be sourced BEFORE compinit.

## completion
zmodload -i zsh/complist
WORDCHARS=''
unsetopt menu_complete flowcontrol
setopt auto_menu complete_in_word always_to_end
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
zstyle '*' single-ignored show
[[ -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh" ]] || mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

## directories
setopt auto_cd auto_pushd pushd_ignore_dups pushdminus
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -- -='cd -'
for i in {1..9}; do alias "$i"="cd -$i"; done; unset i
alias md='mkdir -p'
alias rd=rmdir
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
function d() {
  if [[ -n $1 ]]; then dirs "$@"; else dirs -v | head -n 10; fi
}

## misc
setopt multios long_list_jobs interactivecomments
autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic
export PAGER="${PAGER:-less}" LESS="${LESS:--R}"
alias _='sudo '

## appearance
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls='ls -G'
diff() { command diff --color "$@"; }

## grep (lib/grep.zsh)
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias egrep='grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='grep -F --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
