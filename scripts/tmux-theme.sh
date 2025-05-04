#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/tmux-core.sh"

main() {
	local opt_theme
	local opt_theme_dark
	local opt_theme_light

	tmux set -g @theme_dark "$HOME/.config/tmux/themes/catppuccin-mocha.tmux"
	tmux set -g @theme_light "$HOME/.config/tmux/themes/catppuccin-latte.tmux"

	# dark & light themes
	opt_theme_light="$(tmux_get_option "@theme_light")"
	opt_theme_dark="$(tmux_get_option "@theme_dark")"
	opt_theme_dark_mode="$("${CURRENT_DIR}/tmux-theme-dark.scpt")"

	if [[ "$opt_theme_dark_mode" == "true" ]]; then
		opt_theme="$opt_theme_dark"
	else
		opt_theme="$opt_theme_light"
	fi

	tmux_source_file "$opt_theme"
	tmux_set_variable "TMUX_THEME" "$(basename "${opt_theme%.*}")"
}

main "$@"
