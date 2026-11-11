#!/usr/bin/env bash
# Refresh agent/settings.json from the live ~/.pi/agent (drops machine-specific keys).
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
AGENT="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"
node -e '
const fs=require("fs");const s=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));
for (const k of ["shellPath","lastChangelogVersion"]) delete s[k];
fs.writeFileSync(process.argv[2], JSON.stringify(s,null,2)+"\n");' "$AGENT/settings.json" "$REPO/agent/settings.json"
git -C "$REPO" status --short
