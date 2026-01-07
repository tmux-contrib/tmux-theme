#!/usr/bin/env bash

# Get tmux option with default fallback
#
# Arguments:
#   $1 - option name
#   $2 - default value
# Outputs:
#   Option value or default
tmux_get_option() {
	local option="$1"
	local default="$2"
	local value

	value="$(tmux show-option -gqv "$option")"
	echo "${value:-$default}"
}

# Get tmux variable
#
# Arguments:
#   $1 - option name
# Outputs:
#   Variable value
tmux_get_variable() {
	local name="$1"
	tmux display -p "#{$name}"
}

# Source a tmux config file
#
# Arguments:
#   $1 - file path
tmux_source_file() {
	local file="$1"

	[[ -f "$file" ]] && tmux source-file "$file"
}
