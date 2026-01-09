#!/usr/bin/env bash

_tmux_theme_source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/core.sh
source "$_tmux_theme_source_dir/scripts/core.sh"

main() {
	local theme_mode
	theme_mode="$(tmux_get_variable "client_theme" "dark")"

	local theme_dark
	theme_dark="$(tmux_get_option "@theme_dark" "catppuccin-mocha")"
	# Handle dark theme hook
	tmux set-hook -g client-dark-theme "source-file $_tmux_theme_source_dir/themes/${theme_dark}.conf"

	local theme_light
	theme_light="$(tmux_get_option "@theme_light" "catppuccin-latte")"
	# Handle light theme hook
	tmux set-hook -g client-light-theme "source-file $_tmux_theme_source_dir/themes/${theme_light}.conf"

	if [[ $theme_mode == "dark" ]]; then
		tmux_source_file "$_tmux_theme_source_dir/themes/${theme_dark}.conf"
	elif [[ $theme_mode == "light" ]]; then
		tmux_source_file "$_tmux_theme_source_dir/themes/${theme_light}.conf"
	fi

	local theme_path
	theme_path="$(tmux_get_option "@theme_path" "")"
	# Source user's status bar config (uses @thm_* variables)
	# This runs BEFORE other TPM plugins, so they can interpolate #{cpu_percentage} etc.
	if [[ -n "$theme_path" ]]; then
		tmux_source_file "$theme_path"
	fi
}

main "$@"
