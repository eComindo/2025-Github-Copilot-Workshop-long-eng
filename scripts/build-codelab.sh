#!/usr/bin/env bash
# Export one or more codelab markdown sources to HTML using the local
# claat-template.html (local codelab-elements assets, no dead CDN, no
# analytics), and make sure each exported deck ships its own copy of
# assets/codelab-elements/ so it's self-contained (required since CI only
# uploads a single deck's output folder to Azure Storage).
#
# Usage: scripts/build-codelab.sh workshop_PROC_v3-C-compressed.md [more.md ...]
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAAT_BIN="${CLAAT_BIN:-$HOME/go/bin/claat}"
TEMPLATE="$REPO_ROOT/build/claat-template.html"
ASSETS="$REPO_ROOT/assets/codelab-elements"

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <markdown-file> [more.md ...]" >&2
  exit 1
fi

if ! command -v "$CLAAT_BIN" >/dev/null 2>&1; then
  echo "error: claat binary not found at $CLAAT_BIN (set CLAAT_BIN to override)" >&2
  exit 1
fi

"$CLAAT_BIN" export -f "$TEMPLATE" -o "$REPO_ROOT" -ga "" "$@"

for md in "$@"; do
  id="$(grep -m1 '^id:' "$md" | sed -E 's/^id:[[:space:]]*//')"
  if [ -z "$id" ]; then
    echo "warning: no 'id:' field found in $md, skipping asset sync" >&2
    continue
  fi
  dest="$REPO_ROOT/$id/codelab-elements"
  mkdir -p "$dest"
  cp "$ASSETS"/* "$dest/"
  echo "assets synced -> $dest"
done
