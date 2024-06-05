#!/bin/bash
set -euo pipefail

# alacritty
rm -rf "$HOME/.config/alacritty"
ln -sf "$HOME/dotfiles/alacritty" "$HOME/.config/alacritty"

# gtk
ln -sf "$HOME/dotfiles/gtk/gtk-2/gtkrc-2.0" "$HOME/.gtkrc-2.0"
ln -sf "$HOME/dotfiles/gtk/gtk-3/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# i3 
rm -rf "$HOME/.config/i3"
ln -sf "$HOME/dotfiles/i3" "$HOME/.config/i3"

# neovim
rm -rf "$HOME/.config/nvim"
ln -sf "$HOME/dotfiles/neovim" "$HOME/.config/nvim"

# x
ln -sf "$HOME/dotfiles/x/xinitrc" "$HOME/.xinitrc"
ln -sf "$HOME/dotfiles/x/Xresources" "$HOME/.Xresources"
