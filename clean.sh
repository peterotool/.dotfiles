#!/usr/bin/env bash
set -euo pipefail

echo "🔹 Starting submodule cleanup..."

# Get a list of all submodules from .gitmodules
submodules=$(git config --file .gitmodules --get-regexp path | awk '{print $2}')

for sub in $submodules; do
    echo "➡️ Cleaning submodule: $sub"

    # Deinit if exists
    git submodule deinit -f -- "$sub" 2>/dev/null || true

    # Remove from local git config
    git config --remove-section "submodule.$sub" 2>/dev/null || true

    # Remove .git/modules entry if it exists
    if [ -d ".git/modules/$sub" ]; then
        rm  -rf ".git/modules/$sub"
        echo "   Removed .git/modules/$sub"
    fi

    # Remove from index if still tracked (won’t delete working files)
    git rm -f --cached "$sub" 2>/dev/null || true
done

# Sync submodules and re-initialize
# git submodule sync --recursive
# git submodule update --init --recursive

# echo "✅ Submodule cleanup complete!"
