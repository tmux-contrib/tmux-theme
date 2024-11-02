#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/helpers.sh"

main() {
	local opt_theme
	local opt_theme_dark
	local opt_theme_light

	tmux set -g @theme_dark "$HOME/.config/tmux/themes/catppuccin-mocha.tmux"
	tmux set -g @theme_light "$HOME/.config/tmux/themes/catppuccin-latte.tmux"

	# dark & light themes
	opt_theme_dark="$(get_tmux_option "@theme_dark")"
	opt_theme_light="$(get_tmux_option "@theme_light")"

	opt_theme="$1"
	opt_theme="${opt_theme/dark/$opt_theme_dark}"
	opt_theme="${opt_theme/light/$opt_theme_light}"

	source_tmux_file "$opt_theme"
}

main "$@"
