#!/bin/bash
set -euo pipefail

# alacritty
rm -rf "$XDG_CONFIG_HOME/alacritty"
ln -sf "$DOTFILES/alacritty" "$XDG_CONFIG_HOME/alacritty"

#bat
rm -rf "$XDG_CONFIG_HOME/bat"
ln -sf "$DOTFILES/bat" "$XDG_CONFIG_HOME/bat"

#fish
mkdir -p "$XDG_CONFIG_HOME/fish/completions"
rm -rf "$XDG_CONFIG_HOME/fish/themes"
ln -sf "$DOTFILES/fish/config.fish" "$XDG_CONFIG_HOME/fish/config.fish"
ln -sf "$HOME/.asdf/completions/asdf.fish" "$XDG_CONFIG_HOME/fish/completions/asdf.fish"
ln -sf "$DOTFILES/fish/themes" "$XDG_CONFIG_HOME/fish/themes"

# i3
rm -rf "$XDG_CONFIG_HOME/i3"
ln -sf "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3"

# neovim
rm -rf "$XDG_CONFIG_HOME/nvim"
ln -sf "$DOTFILES/neovim" "$XDG_CONFIG_HOME/nvim"

# X11
ln -sf "$DOTFILES/X11/xinitrc" "$HOME/.xinitrc"
ln -sf "$DOTFILES/X11/Xresources" "$HOME/.Xresources"
