_tv_search() {
    emulate -L zsh
    zle -I

    local current_prompt
    current_prompt=$LBUFFER

    local output

    output=$(tv --autocomplete-prompt "$current_prompt" $*)

    zle reset-prompt

    if [[ -n $output ]]; then
        RBUFFER=""
        LBUFFER=$current_prompt$output

        # uncomment this to automatically accept the line
        # (i.e. run the command without having to press enter twice)
        # zle accept-line
    fi
}


zle -N tv-search _tv_search


bindkey '^T' tv-search


function tv_shell_history() {
  local current_prompt="${READLINE_LINE:0:$READLINE_POINT}"

  local output=$(history -n && history -a && tv bash-history --input "$current_prompt")

  if [[ -n $output ]]; then
    READLINE_LINE=$output
    READLINE_POINT=${#READLINE_LINE}
  fi
}
