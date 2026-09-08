#!/usr/bin/env bash
#
# dark-2026 -- kitty installer
#
# Copies code-2026.conf and light-2026.conf into kitty's themes directory.
#
#   ./install.sh              install both themes (backs up any existing copies)
#   ./install.sh --uninstall  remove the installed themes
#   ./install.sh --help       usage

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="${KITTY_THEME_DIR:-$HOME/.config/kitty/themes}"

THEMES=("code-2026" "light-2026")

bold=''; dim=''; red=''; green=''; yellow=''; reset=''
if [ -t 1 ]; then
  bold=$'\033[1m'; dim=$'\033[2m'; red=$'\033[31m'
  green=$'\033[32m'; yellow=$'\033[33m'; reset=$'\033[0m'
fi

info()  { printf '%s\n' "$*"; }
ok()    { printf '%s✓%s %s\n' "$green" "$reset" "$*"; }
warn()  { printf '%s!%s %s\n' "$yellow" "$reset" "$*" >&2; }
die()   { printf '%s✗%s %s\n' "$red" "$reset" "$*" >&2; exit 1; }

usage() {
  cat <<EOF
${bold}dark-2026 -- kitty installer${reset}

Usage: install.sh [options]

Options:
  -u, --uninstall   Remove the installed themes (and nothing else)
  -f, --force       Overwrite existing themes without keeping backups
  -h, --help        Show this message

Environment:
  KITTY_THEME_DIR   Install location
                    ${dim}(default: ~/.config/kitty/themes)${reset}
EOF
}

action='install'
force=0

while [ $# -gt 0 ]; do
  case "$1" in
    -u|--uninstall) action='uninstall' ;;
    -f|--force)     force=1 ;;
    -h|--help)      usage; exit 0 ;;
    *)              usage >&2; die "unknown option: $1" ;;
  esac
  shift
done

if [ "$action" = 'uninstall' ]; then
  found=0
  for name in "${THEMES[@]}"; do
    target="$THEME_DIR/$name.conf"
    if [ -e "$target" ]; then
      rm -f "$target"
      ok "Removed $target"
      found=1
    fi
  done
  if [ "$found" -eq 1 ]; then
    info "Remove or change the include in ~/.config/kitty/kitty.conf:"
    info "  include themes/<theme-name>.conf"
  else
    info "Nothing to do -- no dark-2026 themes are installed."
  fi
  exit 0
fi

mkdir -p "$THEME_DIR"

for name in "${THEMES[@]}"; do
  source="$SCRIPT_DIR/themes/$name.conf"
  target="$THEME_DIR/$name.conf"

  [ -f "$source" ] || die "theme file not found: $source"

  if [ -e "$target" ]; then
    if [ "$force" -eq 1 ]; then
      rm -f "$target"
    else
      backup="$target.$(date +%Y%m%d%H%M%S).bak"
      mv "$target" "$backup"
      warn "Existing theme moved to $(basename "$backup")"
    fi
  fi

  cp "$source" "$target"
  ok "Installed $target"
done

cat <<EOF

Next, include the theme in ${bold}~/.config/kitty/kitty.conf${reset}:

  ${dim}include themes/code-2026.conf${reset}

${dim}Or for the light variant:${reset}

  ${dim}include themes/light-2026.conf${reset}

${dim}Reload with ctrl+shift+f5, or restart kitty.${reset}
EOF
