#!/usr/bin/env bats

setup() {
	source "$BATS_TEST_DIRNAME/test_helper.bash"
}

# -- _tmux_get_option ------------------------------------------------------

@test "_tmux_get_option: returns default when tmux returns empty" {
	run _tmux_get_option "@nonexistent" "fallback"
	[[ "$output" = "fallback" ]]
}

@test "_tmux_get_option: returns empty when no default provided" {
	run _tmux_get_option "@nonexistent"
	[[ "$output" = "" ]]
}

# -- _tmux_resolve_theme ---------------------------------------------------

@test "_tmux_resolve_theme: bundled name resolves under themes/" {
	run _tmux_resolve_theme "/plugin" "rose-pine"
	[[ "$output" = "/plugin/themes/rose-pine.conf" ]]
}

@test "_tmux_resolve_theme: absolute path is returned as-is" {
	run _tmux_resolve_theme "/plugin" "/home/me/my-theme.conf"
	[[ "$output" = "/home/me/my-theme.conf" ]]
}
