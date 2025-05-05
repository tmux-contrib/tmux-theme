#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/tmux-core.sh"

main() {
	local OPT_THEME_NAME
	local OPT_THEME_PATH

	tmux set -g @theme_dark "$HOME/.config/tmux/themes/catppuccin-mocha.tmux"
	tmux set -g @theme_light "$HOME/.config/tmux/themes/catppuccin-latte.tmux"

	# dark & light themes
	opt_theme_dark_mode="$("${CURRENT_DIR}/tmux-theme-dark.scpt")"

	if [[ "$opt_theme_dark_mode" == "true" ]]; then
		OPT_THEME_PATH="$(tmux_get_option "@theme_dark")"
	else
		OPT_THEME_PATH="$(tmux_get_option "@theme_light")"
	fi

	# refresh the tmux theme
	tmux_source_file "$OPT_THEME_PATH"

	OPT_THEME_NAME="$(basename "${OPT_THEME_PATH%.*}")"
	# set environment variables
	tmux_set_variable "TMUX_THEME" "$OPT_THEME_NAME"
	# refresh the tmux client
	tmux_refresh_client
}

main "$@"
