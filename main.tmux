#!/usr/bin/env bash
set -euo pipefail

[[ -z "${DEBUG:-}" ]] || set -x

_tmux_theme_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

[[ -f "$_tmux_theme_root/scripts/tmux_core.sh" ]] || {
	echo "tmux-theme: missing tmux_core.sh" >&2
	exit 1
}

# shellcheck source=scripts/tmux_core.sh
source "$_tmux_theme_root/scripts/tmux_core.sh"

main() {
	local theme_mode
	theme_mode="$(_tmux_get_variable "client_theme" "dark")"

	local theme_dark
	theme_dark="$(_tmux_get_option "@theme-dark" "catppuccin-mocha")"
	# Handle dark theme hook
	tmux set-hook -g client-dark-theme "source-file $_tmux_theme_root/themes/${theme_dark}.conf"

	local theme_light
	theme_light="$(_tmux_get_option "@theme-light" "catppuccin-latte")"
	# Handle light theme hook
	tmux set-hook -g client-light-theme "source-file $_tmux_theme_root/themes/${theme_light}.conf"

	if [[ $theme_mode == "dark" ]]; then
		_tmux_source_file "$_tmux_theme_root/themes/${theme_dark}.conf"
	elif [[ $theme_mode == "light" ]]; then
		_tmux_source_file "$_tmux_theme_root/themes/${theme_light}.conf"
	fi

	local theme_path
	theme_path="$(_tmux_get_option "@theme-path" "")"
	# Source user's status bar config (uses @thm_* variables)
	# This runs BEFORE other TPM plugins, so they can interpolate #{cpu_percentage} etc.
	if [[ -n "$theme_path" ]]; then
		_tmux_source_file "$theme_path"
	fi
}

main "$@"
