# XDG Base Directory
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Disable the fish welcome message
set -g fish_greeting

# Enable vi-mode
set -g fish_key_bindings fish_vi_key_bindings

# Set theme
fish_config theme choose "tokyonight-moon"

# Go
fish_add_path $HOME/go/bin
