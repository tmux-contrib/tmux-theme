# tmux-theme

> Automatically switch your tmux theme between dark and light mode on macOS. Bundles color themes and exposes variables for status bar customization.

[![CI](https://github.com/tmux-contrib/tmux-theme/actions/workflows/ci.yml/badge.svg)](https://github.com/tmux-contrib/tmux-theme/actions/workflows/ci.yml) [![Release](https://img.shields.io/github/v/release/tmux-contrib/tmux-theme)](https://github.com/tmux-contrib/tmux-theme/releases) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Dependencies

### Required

- [tmux](https://github.com/tmux/tmux) 3.5+ (for `client-dark-theme` / `client-light-theme` hooks)

## Installation

Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-theme'
```

And install it by running `<prefix> + I`.

## Available Themes

The plugin includes 7 theme variants across 2 theme families:

### Catppuccin

- `catppuccin-mocha` - Dark theme with warm tones
- `catppuccin-frappe` - Dark theme with cool tones
- `catppuccin-macchiato` - Dark theme, balanced
- `catppuccin-latte` - Light theme

### Rose Pine

- `rose-pine` - Dark main variant
- `rose-pine-moon` - Darker variant with muted colors
- `rose-pine-dawn` - Light theme

## Configuration

Set the desired themes in your `~/.tmux.conf`:

```tmux
# Select a dark theme (default: catppuccin-mocha)
set -g @theme-dark "rose-pine-moon"

# Select a light theme (default: catppuccin-latte)
set -g @theme-light "rose-pine-dawn"

# Optional: Path to your status bar config (sourced after theme colors are loaded)
# Note: Use $HOME instead of ~ for path expansion
set -g @theme-path "$HOME/.config/tmux/status.tmux"
```

## Pane Focus

Optionally give the active pane a different background from inactive ones. Off by default, so existing setups are unchanged:

```tmux
# off (default) | dim | dim-transparent
set -g @theme-pane-focus "dim"
```

- `dim` - active pane uses the theme background, inactive panes use a darker shade (`@thm_inactive_bg`, falling back to `@thm_mantle` for custom themes).
- `dim-transparent` - same, but the active pane keeps your terminal's own background (`bg=default`), for translucent terminals or background images.

This uses tmux's `window-style` / `window-active-style`, so it works with any number of splits and follows dark/light switching. It sets those two global options, overriding your own values. Apps that paint their own background (e.g. vim with an opaque colorscheme) are not dimmed.

## Custom Themes

`@theme-dark` and `@theme-light` also accept an absolute path to your own theme file, so it survives plugin updates:

```tmux
set -g @theme-dark  "$HOME/.config/tmux/themes/my-dark.conf"
set -g @theme-light "rose-pine-dawn"
```

A custom theme is a regular tmux config file that sets the same `@thm_*` variables as the bundled themes (see [`themes/rose-pine.conf`](themes/rose-pine.conf) for a template). Use `$HOME` instead of `~` so the path expands.

## Development

### Prerequisites

Install dependencies using [Nix](https://nixos.org/):

```sh
nix develop
```

Or install manually: `bash`, `tmux`, `bats`

### Running Tests

```sh
bats tests/
```

### Debugging

Enable trace output with the `DEBUG` environment variable:

```sh
DEBUG=1 tmux source-file /path/to/tmux-theme/main.tmux
```

## License

MIT
