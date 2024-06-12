set -gx EDITOR nvim
set -gx VISUAL nvim

# Enable vi-mode https://fishshell.com/docs/current/cmds/fish_vi_key_bindings.html
set -g fish_key_bindings fish_vi_key_bindings

source ~/.asdf/asdf.fish

fish_config theme choose "Catppuccin Mocha"