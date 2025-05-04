#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
THEME_PATH="${CURRENT_DIR}/scripts/tmux-theme.sh"

main() {
	"${CURRENT_DIR}/scripts/tmux-theme-daemon.swift" "${THEME_PATH}" &
}

main
