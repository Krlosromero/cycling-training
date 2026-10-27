#!/usr/bin/env bash
# Builds dist/victoranto-cycling-coach-<version>.zip, ready to upload in
# Claude > Customize > Plugins > Add > Upload plugin, or to attach to a GitHub release.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
"$ROOT/scripts/sync-shared.sh"

VERSION="$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' "$ROOT/plugins/victoranto-cycling-coach/.claude-plugin/plugin.json" | head -1)"
mkdir -p "$ROOT/dist"
OUT="$ROOT/dist/victoranto-cycling-coach-$VERSION.zip"
rm -f "$OUT"

cd "$ROOT/plugins"
zip -r -q "$OUT" victoranto-cycling-coach -x '*.DS_Store'
echo "built $OUT"
