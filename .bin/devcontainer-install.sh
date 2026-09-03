#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# 1. コンテナ内ホームディレクトリへのリンク (Antigravity / Codex / Claude Code)
mkdir -p "$HOME/.gemini/config"
ln -sf "$SCRIPT_DIR/AGENTS.md" "$HOME/.gemini/config/AGENTS.md"
ln -sf "$SCRIPT_DIR/antigravity/GEMINI.md" "$HOME/.gemini/config/GEMINI.md"

mkdir -p "$HOME/.claude"
ln -sf "$SCRIPT_DIR/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

mkdir -p "$HOME/.codex"
ln -sf "$SCRIPT_DIR/AGENTS.md" "$HOME/.codex/AGENTS.md"
ln -sf "$SCRIPT_DIR/AGENTS.md" "$HOME/AGENTS.md"

# 2. 親階層 (/workspaces) へのリンク配置
if [ -d "/workspaces" ]; then
    create_link() {
        src="$1"
        dst="$2"
        if [ -w "/workspaces" ]; then
            ln -sf "$src" "$dst"
        elif command -v sudo >/dev/null 2>&1; then
            sudo ln -sf "$src" "$dst"
        fi
    }

    create_link "$SCRIPT_DIR/AGENTS.md" "/workspaces/AGENTS.md"
    create_link "$SCRIPT_DIR/antigravity/GEMINI.md" "/workspaces/GEMINI.md"
    create_link "$SCRIPT_DIR/claude/CLAUDE.md" "/workspaces/CLAUDE.md"
fi

echo "[dotfiles] Dev Container agent rules installed successfully."
