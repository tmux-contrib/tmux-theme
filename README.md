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
set -g @theme "catppuccin-mocha"
```

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
