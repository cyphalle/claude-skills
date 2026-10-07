#!/usr/bin/env bash
# Symlink every skill of this repository into ~/.claude/skills.
# An existing entry with the same name is left untouched and reported.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$DEST"

for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  target="$DEST/$name"
  if [[ -e "$target" || -L "$target" ]]; then
    echo "skip   $name (already exists at $target)"
    continue
  fi
  ln -s "${dir%/}" "$target"
  echo "linked $name"
done

[[ -f "$DEST/config.md" ]] || echo "next: cp config.example.md $DEST/config.md and fill it in"
