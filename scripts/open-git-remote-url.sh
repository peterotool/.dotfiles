#!/usr/bin/env bash

dir=$(tmux display-message -p "#{pane_current_path}")

# Open the current repository in the browser
cd "$dir" || exit 1

# Get the URL of the "origin" remote from the current git repository.
# Example output:
#   - "git@github.com:user/repo.git" (SSH)
#   - "https://github.com/user/repo.git" (HTTPS)
# "2>/dev/null" hides error messages in case the repo has no remotes configured.
url=$(git remote get-url origin 2>/dev/null)

# If $url is empty, it means there is no remote named "origin" in this repo.
if [[ -z "$url" ]]; then
    echo "No git remote 'origin' found"
    exit 1
fi

# --- Normalize URLs ---
if [[ $url == git@github.com:* ]]; then
    # SSH style GitHub: git@github.com:user/repo.git → https://github.com/user/repo
    url="https://github.com/${url#git@github.com:}"
elif [[ $url == git@gitlab.com:* ]]; then
    # SSH style GitLab: git@gitlab.com:user/repo.git → https://gitlab.com/user/repo
    url="https://gitlab.com/${url#git@gitlab.com:}"
fi

# Remove trailing .git if it exists
url="${url%.git}"

# --- Open depending on host ---
if [[ $url == *github.com* ]]; then
    open "$url"
elif [[ $url == *gitlab.com* ]]; then
    open "$url"
else
    echo "This repository is not hosted on GitHub or GitLab"
fi
