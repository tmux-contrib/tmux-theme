# tmux-theme

A simple tmux theme plugin that bundles color themes and exposes variables for
status bar customization.

## Installation

Using [TPM](https://github.com/tmux-plugins/tpm):

```bash
set -g @plugin 'tmux-contrib/tmux-theme'
```

## Configuration

```bash
# Select a theme
set -g @theme "catppuccin-mocha"

# Optional: Path to your status bar config (sourced after theme colors are loaded)
# Note: Use $HOME instead of ~ for path expansion
set -g @theme_status_path "$HOME/.config/tmux/status.tmux"
```

The `@theme_status_path` option allows you to specify a file that configures your
status bar using the theme's color variables. This file is sourced **after** the
theme colors are set but **before** other TPM plugins run, ensuring proper
integration with plugins like `tmux-cpu` and `tmux-battery`.

## Available Themes

- `catppuccin-mocha` (dark)
- `catppuccin-macchiato` (dark)
- `catppuccin-frappe` (dark)
- `catppuccin-latte` (light)

## Theme Variables

See `themes/*.conf` for available color variables (`@thm_*`).

## Customization Example

```bash
set -g status-style "fg=#{@thm_fg},bg=#{@thm_bg}"
set -g status-left "#[bg=#{@thm_green}] #S "
set -g pane-border-style "fg=#{@thm_surface_0}"
set -g pane-active-border-style "fg=#{@thm_blue}"
```

## License

MIT
