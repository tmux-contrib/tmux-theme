#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/tmux-core.sh"

main() {
	# shellcheck disable=1090
	opt_theme="$("${CURRENT_DIR}"/scripts/tmux-theme.sh)"

	tmux_source_file "$opt_theme"
}

main
