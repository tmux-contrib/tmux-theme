# tmux-theme

A simple tmux theme plugin that bundles color themes and exposes variables for
status bar customization.

## Installation

Using [TPM](https://github.com/tmux-plugins/tpm):

```bash
set -g @plugin 'tmux-contrib/tmux-theme'
```

## Available Themes

The plugin includes 7 theme variants across 2 theme families:

### Catppuccin

- `catppuccin-mocha.conf` - Dark theme with warm tones
- `catppuccin-frappe.conf` - Dark theme with cool tones
- `catppuccin-macchiato.conf` - Dark theme, balanced
- `catppuccin-latte.conf` - Light theme

### Rose Pine

- `rose-pine.conf` - Dark main variant
- `rose-pine-moon.conf` - Darker variant with muted colors
- `rose-pine-dawn.conf` - Light theme

## Configuration

Set the desired themes in your `.tmux.conf`:

```bash
# Select a dark theme
set -g @theme-dark "rose-pine-moon"

# Select a light theme
set -g @theme-light "rose-pine-dawn"

# Optional: Path to your status bar config (sourced after theme colors are loaded)
# Note: Use $HOME instead of ~ for path expansion
set -g @theme-path "$HOME/.config/tmux/status.tmux"
```

## License

MIT
