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

	# @theme-dark / @theme-light accept a bundled theme name or an absolute
	# path to a custom theme file.
	local theme_dark
	theme_dark="$(_tmux_resolve_theme "$_tmux_theme_root" "$(_tmux_get_option "@theme-dark" "catppuccin-mocha")")"
	# Handle dark theme hook
	tmux set-hook -g client-dark-theme "source-file \"$theme_dark\""

	local theme_light
	theme_light="$(_tmux_resolve_theme "$_tmux_theme_root" "$(_tmux_get_option "@theme-light" "catppuccin-latte")")"
	# Handle light theme hook
	tmux set-hook -g client-light-theme "source-file \"$theme_light\""

	if [[ $theme_mode == "dark" ]]; then
		_tmux_source_file "$theme_dark"
	elif [[ $theme_mode == "light" ]]; then
		_tmux_source_file "$theme_light"
	fi

	# Opt-in: dim inactive panes. tmux picks window-active-style for the active
	# pane and window-style for the rest, so splits need no focus hook.
	local pane_styles
	pane_styles="$(_tmux_pane_focus_styles "$(_tmux_get_option "@theme-pane-focus" "off")")"
	if [[ -n "$pane_styles" ]]; then
		tmux set-option -g window-style "${pane_styles%%|*}"
		tmux set-option -g window-active-style "${pane_styles#*|}"
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
