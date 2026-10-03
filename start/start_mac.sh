#!/bin/bash

echo "🎓 Starting workspace…"

# --- Paths (quoted for safety: spaces + emojis) ---

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

if ! PROJECT_ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null)"; then
    PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd -P)"
fi

### BEGIN BACKUP ###
#PROJECT_ROOT="/Users/adrian/Documents/PROJECTS/Coursework/Analyse/aSS1"
ABLETON_SET="$PROJECT_ROOT/live/demo Project/demo.als"
### END BACKUP ###

SIBELIUS_SCORE="$PROJECT_ROOT/scores/demo2.sib"
README_MD="$PROJECT_ROOT/README.md"
START_SCRIPT="$PROJECT_ROOT/start/start_mac.sh"
MAX_PATCH="$PROJECT_ROOT/viewer/verovio4live/verovio4live/verovio4live.maxproj"
QLC_PROJECT="$PROJECT_ROOT/qlc+/WLED8-functions.qxw"

TRELLO_CARD="https://trello.com/c/pM23x1hW/154-%E2%99%AB-disarray"

GITHUB_ROOT="https://github.com/AdrianArtacho/"
GITHUB_REPO="$GITHUB_ROOT/aSS1"


# --- Sourcetree UI ---

open -a SourceTree "$PROJECT_ROOT"
sleep 2

# --- Launch applications with specific files ---

# Ableton Live
open "$ABLETON_SET"
sleep 2

# Sibelius
# open "$SIBELIUS_SCORE"
# sleep 2

# Standalone Maxpatch
open "$MAX_PATCH"
sleep 2

# QLC+
open "$QLC_PROJECT"
sleep 2

# ==============================
# Open project context
# ==============================

# Markdown file (opens in default editor, e.g. VS Code / Typora)
# open "$README_MD"
# sleep 2

# Local folder
# open "$PROJECT_ROOT"
# sleep 2

# open "$START_SCRIPT"
# sleep 2

# ==============================
# Online resources
# ==============================

# open "$TRELLO_CARD"
# sleep 2

open "$GITHUB_REPO"
sleep 2

# ==============================
# Local HTTP server
# ==============================

echo "🌐 Starting local server on port 8000…"

cd "$PROJECT_ROOT" || exit

# Start server in background
python3 -m http.server 8000 &

sleep 2

# Open browser
open "http://localhost:8000"

#-------------------------------

echo "✅ Workspace ready."
