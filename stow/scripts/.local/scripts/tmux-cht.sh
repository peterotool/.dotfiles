#!/usr/bin/env bash

selected=$(cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf)
if [[ -z $selected ]]; then # If the user does not select anything (i.e., selected is empty), the script exits with a status code of 0 (successful exit)
    exit 0
fi

read -r -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    # The query is processed to replace spaces ( ) with plus signs (+) using tr. This is because URLs typically use + to represent spaces.
    query=$(echo "$query" | tr ' ' '+')
    # Handle Language-Specific Queries
    # A new tmux window is created (tmux neww) to execute a command
    # while [ : ] Keeps the tmux window open by running an infinite loop. This ensures the window does not close immediately after the curl command completes.
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    # Handle Command-Specific Queries
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
