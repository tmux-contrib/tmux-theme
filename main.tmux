#!/usr/bin/env bash

_tmux_theme_source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/core.sh
source "$_tmux_theme_source_dir/scripts/core.sh"

main() {
    local theme_name theme_status_path

    # Get configuration options
    theme_name="$(tmux_get_option "@theme" "catppuccin-mocha")"
    theme_status_path="$(tmux_get_option "@theme_status_path" "")"

    # Source theme file (sets @thm_* color variables)
    tmux_source_file "$_tmux_theme_source_dir/themes/${theme_name}.conf"

    # Source user's status bar config (uses @thm_* variables)
    # This runs BEFORE other TPM plugins, so they can interpolate #{cpu_percentage} etc.
    if [[ -n "$theme_status_path" ]]; then
        tmux_source_file "$theme_status_path"
    fi
}

main "$@"
