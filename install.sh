#!/bin/bash
set -euo pipefail

# alacritty
mkdir -p "$HOME/.config/alacritty"
rm -rf "$HOME/.config/alacritty"
ln -sf "$HOME/dotfiles/alacritty" "$HOME/.config/alacritty"

# gtk
mkdir -p "$HOME/.config/gtk-3.0"
ln -sf "$HOME/dotfiles/gtk/gtk-2/gtkrc-2.0" "$HOME/.gtkrc-2.0"
ln -sf "$HOME/dotfiles/gtk/gtk-3/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# i3 
mkdir -p "$HOME/.config/i3"
rm -rf "$HOME/.config/i3"
ln -sf "$HOME/dotfiles/i3" "$HOME/.config/i3"

#icons
mkdir -p "$HOME/.icons/default"
mkdir -p "$HOME/.local/share/icons/default"
ln -sf "$HOME/dotfiles/icons/index/index.theme" "$HOME/.icons/default/index.theme"
ln -sf "$HOME/dotfiles/icons/index/index.theme" "$HOME/.local/share/icons/default/index.theme"

# neovim
mkdir -p "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim"
ln -sf "$HOME/dotfiles/neovim" "$HOME/.config/nvim"

# x
ln -sf "$HOME/dotfiles/x/xinitrc" "$HOME/.xinitrc"
ln -sf "$HOME/dotfiles/x/Xresources" "$HOME/.Xresources"
