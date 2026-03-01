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
