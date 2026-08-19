#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MODE="full"
DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --minimal) MODE=minimal ;;
    --with-ai) MODE=ai ;;
    --dry-run) DRY_RUN=1 ;;
    -h|--help) printf 'Usage: %s [--minimal|--with-ai] [--dry-run]\n' "$0"; exit 0 ;;
    *) printf 'Unknown option: %s\n' "$arg" >&2; exit 2 ;;
  esac
done

log(){ printf '\033[1;36m[dotfiles]\033[0m %s\n' "$*"; }
run(){ (( DRY_RUN )) && printf '+ %s\n' "$*" || eval "$@"; }
backup(){ local target="$1"; if [[ -e "$target" && ! -L "$target" ]]; then local b="$target.backup.$(date +%Y%m%d-%H%M%S)"; run "mv -- \"$target\" \"$b\""; log "Backed up $target"; fi; }
link(){ local source="$1" target="$2"; mkdir -p "$(dirname -- "$target")"; backup "$target"; run "ln -sfn -- \"$source\" \"$target\""; }

command -v zsh >/dev/null || { log 'zsh is required; install it with your distro package manager.'; exit 1; }
link "$ROOT_DIR/shell/zshrc" "$HOME/.zshrc"
link "$ROOT_DIR/shell/aliases.zsh" "$HOME/.aliases"
link "$ROOT_DIR/config/starship.toml" "$HOME/.config/starship.toml"
mkdir -p "$HOME/.local/bin" "$HOME/.config/dotfiles"
link "$ROOT_DIR/bin/dotfiles-doctor" "$HOME/.local/bin/dotfiles-doctor"

plugins="$HOME/.local/share/zsh/plugins"; mkdir -p "$plugins"
clone_plugin(){ local url="$1" dir="$2"; if [[ ! -d "$plugins/$dir" ]]; then run "git clone --depth=1 \"$url\" \"$plugins/$dir\""; fi; }
command -v git >/dev/null && { clone_plugin https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions; clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting; }
(( DRY_RUN )) || chmod +x "$ROOT_DIR/bin/dotfiles-doctor"
log 'Installed Linux Zsh dotfiles. Start with: exec zsh'
log "Mode: $MODE (AI tools are never installed automatically)"
