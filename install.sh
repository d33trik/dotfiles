#!/bin/bash
set -euo pipefail

# alacritty
rm -rf "$HOME/.config/alacritty"
ln -sf "$HOME/dotfiles/alacritty" "$HOME/.config/alacritty"

#bat
rm -rf "$HOME/.config/bat"
ln -sf "$HOME/dotfiles/bat" "$HOME/.config/bat"

#fish
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/fish/completions"
rm -rf "$HOME/.config/fish/themes"
ln -sf "$HOME/dotfiles/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "$HOME/.asdf/completions/asdf.fish" "$HOME/.config/fish/completions/asdf.fish"
ln -sf "$HOME/dotfiles/fish/themes" "$HOME/.config/fish/themes"

# gtk
mkdir -p "$HOME/.config/gtk-3.0"
ln -sf "$HOME/dotfiles/gtk/gtk-2/gtkrc-2.0" "$HOME/.gtkrc-2.0"
ln -sf "$HOME/dotfiles/gtk/gtk-3/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# i3
rm -rf "$HOME/.config/i3"
ln -sf "$HOME/dotfiles/i3" "$HOME/.config/i3"

#icons
mkdir -p "$HOME/.icons/default"
mkdir -p "$HOME/.local/share/icons/default"
ln -sf "$HOME/dotfiles/icons/index/index.theme" "$HOME/.icons/default/index.theme"
ln -sf "$HOME/dotfiles/icons/index/index.theme" "$HOME/.local/share/icons/default/index.theme"

# neovim
rm -rf "$HOME/.config/nvim"
ln -sf "$HOME/dotfiles/neovim" "$HOME/.config/nvim"

# X11
ln -sf "$HOME/dotfiles/X11/xinitrc" "$HOME/.xinitrc"
ln -sf "$HOME/dotfiles/X11/Xresources" "$HOME/.Xresources"
