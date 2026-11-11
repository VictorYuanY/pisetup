#!/usr/bin/env bash
# Set up pi on macOS from this repo. Safe to re-run.
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
AGENT="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"

# 1. Homebrew + tools pi uses (git, node, ripgrep, fd; uv for Python scripts)
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
fi
brew install git node ripgrep fd uv || true

# 2. pi (official installer; update later with `pi update`)
command -v pi >/dev/null || curl -fsSL https://pi.dev/install.sh | sh
export PATH="$HOME/.pi/agent/bin:$HOME/.local/bin:$PATH"

# 3. Settings (existing file is backed up)
mkdir -p "$AGENT"
[ -f "$AGENT/settings.json" ] && cp "$AGENT/settings.json" "$AGENT/settings.json.bak.$(date +%Y%m%d%H%M%S)"
cp "$REPO/agent/settings.json" "$AGENT/settings.json"

# 4. Extensions / packages
pi install git:github.com/spoj/pi-tiny-tools || true
pi list || true

echo; echo "Done. Run: pi   then  /login openrouter"
