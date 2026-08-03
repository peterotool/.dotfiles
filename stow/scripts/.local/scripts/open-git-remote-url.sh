#!/usr/bin/env bash
set -euo pipefail

# Get the current directory from tmux when inside tmux,
# otherwise use the normal shell's working directory.
if [[ -n "${TMUX-}" ]]; then
    dir="$(tmux display-message -p '#{pane_current_path}')"
else
    dir="$PWD"
fi

cd "$dir"

# Verify we're inside a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not inside a git repository"
    exit 1
fi

# Prefer origin, but fall back to the first remote if origin doesn't exist
url="$(git remote get-url origin 2>/dev/null || true)"
if [[ -z "$url" ]]; then
    url="$(git remote -v | awk 'NR==1 {print $2}')"
fi

if [[ -z "$url" ]]; then
    echo "No git remotes found"
    exit 1
fi

# Normalize GitHub/GitLab SSH URLs to HTTPS
case "$url" in
git@github.com:*)
    url="https://github.com/${url#git@github.com:}"
    ;;
git@gitlab.com:*)
    url="https://gitlab.com/${url#git@gitlab.com:}"
    ;;
esac

# Remove trailing .git
url="${url%.git}"

# Open in browser
open "$url"
