#!/usr/bin/env bash
set -euo pipefail

DIR="${HOME}/.local/share/tmux/resurrect"
RESTORE="${HOME}/.tmux/tpm-plugins/tmux-resurrect/scripts/restore.sh"

[ -d "$DIR" ] || { echo "Resurrect dir not found: $DIR"; exit 1; }
[ -x "$RESTORE" ] || { echo "restore.sh not found/executable: $RESTORE"; exit 1; }

mtime() { stat -f %m "$1" 2>/dev/null || stat -c %Y "$1"; }

SNAPSHOT=$(
  find "$DIR" -maxdepth 1 -type f -name "tmux_resurrect_*" -print0 |
    while IFS= read -r -d '' f; do printf '%s\t%s\n' "$(mtime "$f")" "$f"; done |
    sort -nr | cut -f2- |
    fzf --prompt="snapshot > " \
      --preview "sed -n '1,120p' {}" \
      --preview-window=right:60%
)
[ -z "${SNAPSHOT:-}" ] && exit 0

# IMPORTANT: resurrect uses this symlink named "last"
ln -sf "$(basename "$SNAPSHOT")" "$DIR/last"

# Restore
"$RESTORE"
