# pi setup

My [pi](https://pi.dev) settings and extensions, to set up a new Mac quickly.

## New Mac

```bash
git clone https://github.com/<you>/pi-setup.git ~/pi-setup
~/pi-setup/scripts/install-mac.sh
pi            # then: /login openrouter
```

The script installs Homebrew, `git node ripgrep fd uv`, pi (`curl -fsSL https://pi.dev/install.sh | sh`),
copies `agent/settings.json` to `~/.pi/agent/` and installs the extensions.

## Contents

- `agent/settings.json`: OpenRouter, `anthropic/claude-opus-5.5`, hidden thinking blocks, packages.
- Extensions: [`git:github.com/spoj/pi-tiny-tools`](https://github.com/spoj/pi-tiny-tools) (`/trace`, Alt+T).
  Add more with `pi install <source>`, then run `scripts/export-from-pc.sh` and commit.
- Not committed: `auth.json` (API key), sessions, pi install files.

Update later: `pi update` (pi), `pi update --extensions`, `pi update --all`.
