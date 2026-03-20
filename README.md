# tmux-theme

> Automatically switch your tmux theme between dark and light mode on macOS. Bundles color themes and exposes variables for status bar customization.

[![Test](https://github.com/tmux-contrib/tmux-theme/actions/workflows/test.yml/badge.svg)](https://github.com/tmux-contrib/tmux-theme/actions/workflows/test.yml) [![Release](https://img.shields.io/github/v/release/tmux-contrib/tmux-theme)](https://github.com/tmux-contrib/tmux-theme/releases) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

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
