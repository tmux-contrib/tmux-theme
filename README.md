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

Select a theme by sourcing it in your `.tmux.conf`:

```bash
# Catppuccin themes
source-file "$TMUX_PLUGIN_MANAGER_PATH/tmux-theme/themes/catppuccin-mocha.conf"

# Rose Pine themes
source-file "$TMUX_PLUGIN_MANAGER_PATH/tmux-theme/themes/rose-pine.conf"
```

## License

MIT
