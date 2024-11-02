#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/helpers.sh"

# shellcheck disable=1090
TMUX_THEME_DIR=${HOME}/.config/tmux/themes

main() {
	local opt_theme
	local opt_theme_dark
	local opt_theme_light

	# dark & light themes
	opt_theme_dir="$(tmux_get_option "@theme_dir" "$TMUX_THEME_DIR")"
	opt_theme_dark="$(tmux_get_option "@theme_dark" "catppuccin-mocha")"
	opt_theme_light="$(tmux_get_option "@theme_light" "catppuccin-latte")"

	# change the theme
	if [ "$("${CURRENT_DIR}/dark-mode.scpt")" = "true" ]; then
		opt_theme="${opt_theme_dark}"
	else
		opt_theme="${opt_theme_light}"
	fi

	tmux_source_file "$opt_theme_dir/$opt_theme.tmux"
	tmux_set_variable TMUX_THEME "$opt_theme"
}

main
