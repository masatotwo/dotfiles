#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# .bin 内のdotfileのシンボリックリンクをホームディレクトリに作成
for dotfile in "${SCRIPT_DIR}"/.??* ; do
  [[ "$dotfile" == "${SCRIPT_DIR}/.git" ]] && continue
  [[ "$dotfile" == "${SCRIPT_DIR}/.github" ]] && continue
  [[ "$dotfile" == "${SCRIPT_DIR}/.DS_Store" ]] && continue

  ln -fnsv "$dotfile" "$HOME"
done

# 手元で直接書いた設定を ln -f で黙って消さないよう、実ファイルは退避してからリンクする
link_file() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mv -v "$dest" "${dest}.bak.$(date +%Y%m%d%H%M%S)"
  fi
  ln -fnsv "$src" "$dest"
}

# Claude Code はユーザー共通の指示として ~/.claude/CLAUDE.md しか読まないため、
# 共通 AGENTS.md も ~/.claude に置き CLAUDE.md から @ インポートさせる
link_file "${DOTFILES_DIR}/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
link_file "${DOTFILES_DIR}/AGENTS.md" "$HOME/.claude/AGENTS.md"
