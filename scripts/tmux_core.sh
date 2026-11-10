#!/usr/bin/env bash
# tmux_core.sh — shared library; meant to be sourced, not executed directly.

# Get a tmux option with default fallback
#
# Arguments:
#   $1 - option name
#   $2 - (optional) default value
# Outputs:
#   Option value or default
_tmux_get_option() {
	local option="$1"
	local default="${2:-}"
	local value

	value="$(tmux show-option -gqv "$option" 2>/dev/null)"
	echo "${value:-$default}"
}

# Get a tmux variable
#
# Arguments:
#   $1 - variable name
#   $2 - (optional) default value
# Outputs:
#   Variable value or default
_tmux_get_variable() {
	local name="$1"
	local default="${2:-}"
	local value

	value="$(tmux display -p "#{$name}")"
	echo "${value:-$default}"
}

# Source a tmux config file
#
# Arguments:
#   $1 - file path
_tmux_source_file() {
	local file="$1"

	[[ -f "$file" ]] && tmux source-file "$file"
}

# Resolve a theme setting to a theme file path
#
# A value starting with "/" is treated as an absolute path to a custom theme
# file and returned as-is. Anything else is a bundled theme name, resolved to
# <root>/themes/<name>.conf.
#
# Arguments:
#   $1 - plugin root directory
#   $2 - theme name or absolute path
# Outputs:
#   Path to the theme file
_tmux_resolve_theme() {
	local root="$1"
	local theme="$2"

	if [[ $theme == /* ]]; then
		echo "$theme"
	else
		echo "$root/themes/${theme}.conf"
	fi
}
