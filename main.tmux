#!/usr/bin/env bash

_tmux_theme_source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/core.sh
source "$_tmux_theme_source_dir/scripts/core.sh"

main() {
    local theme_name
    theme_name="$(tmux_get_option "@theme" "catppuccin-mocha")"

    # Source theme file
    tmux_source_file "$_tmux_theme_source_dir/themes/${theme_name}.conf"
}

main "$@"
