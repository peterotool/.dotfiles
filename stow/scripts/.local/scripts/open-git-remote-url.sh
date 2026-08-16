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

# Check which Git hosting service the URL belongs to.
case "$url" in

# The pattern matches URLs beginning with "git@github.com:".
#
# The ")" marks the end of the pattern and the beginning of
# the commands that should run when the pattern matches.
git@github.com:*)
    # ${url#git@github.com:}
    # The "#" removes the matching text from the beginning of $url.
    #
    # Example:
    # ${url#git@github.com:}
    # turns:
    # git@github.com:owner/repository.git
    # into:
    # owner/repository.git
    #
    # Then the HTTPS prefix is added:
    # https://github.com/owner/repository.git
    url="https://github.com/${url#git@github.com:}"

    # The ";;" marks the end of this case branch.
    ;;

# The pattern matches URLs beginning with "git@gitlab.com:".
#
# The ")" ends the pattern and starts the GitLab commands.
git@gitlab.com:*)
    # "#" removes "git@gitlab.com:" from the beginning of $url.
    # Then "https://gitlab.com/" is added.
    url="https://gitlab.com/${url#git@gitlab.com:}"

    # End this case branch.
    ;;

# The pattern matches URLs beginning with "git@bitbucket.org:".
#
# The ")" ends the pattern and starts the Bitbucket commands.
git@bitbucket.org:*)
    # "#" removes "git@bitbucket.org:" from the beginning of $url.
    # Then "https://bitbucket.org/" is added.
    url="https://bitbucket.org/${url#git@bitbucket.org:}"

    # End this case branch.
    ;;

# "esac" ends the entire case statement.
# It is "case" written backward.
esac

# "${url%.git}"
# The "%" removes the matching text from the end of $url.
#
# Example:
# ${url%.git}
# turns:
# https://github.com/owner/repository.git
# into:
# https://github.com/owner/repository
#
# If the URL does not end with ".git", it remains unchanged.
url="${url%.git}"

# Open in browser
open "$url"
