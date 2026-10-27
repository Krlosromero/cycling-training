#!/usr/bin/env bash
# Copies the shared method files into every skill's references/ folder.
# Edit files in shared/, never the copies, then run this script.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SHARED="$ROOT/shared"
SKILLS="$ROOT/plugins/victoranto-cycling-coach/skills"

for skill in "$SKILLS"/*/; do
  mkdir -p "$skill/references"
  cp "$SHARED"/*.md "$skill/references/"
  echo "synced $(basename "$skill")"
done

cp "$ROOT/LICENSE" "$ROOT/plugins/victoranto-cycling-coach/LICENSE"
echo "done"
