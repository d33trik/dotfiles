# XDG Base Directory - https://wiki.archlinux.org/title/XDG_Base_Directory
# User-specific configurations (analogous to /etc)
set -gx XDG_CONFIG_HOME $HOME/.config

# User-specific non-essential cached data (analogous to /var/cache)
set -gx XDG_CACHE_HOME $HOME/.cache

# User-specific data files (analogous to /usr/share)
set -gx XDG_DATA_HOME $HOME/.local/share

# User-specific state files (analogous to /var/lib)
set -gx XDG_STATE_HOME $HOME/.local/state

# Dotfiles
set -gx DOTFILES $HOME/dotfiles

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Enable vi-mode - https://fishshell.com/docs/current/cmds/fish_vi_key_bindings.html
set -g fish_key_bindings fish_vi_key_bindings

source ~/.asdf/asdf.fish

fish_config theme choose "Catppuccin Mocha"