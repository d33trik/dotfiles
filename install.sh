#!/bin/bash
set -euo pipefail

# alacritty
mkdir -p "$HOME/.config/alacritty"
rm -rf "$HOME/.config/alacritty"
ln -sf "$HOME/dotfiles/alacritty" "$HOME/.config/alacritty"

# fonts
mkdir -p "$HOME/.local/share/fonts"
rm -rf "$HOME/.local/share/fonts"
ln -sf "$HOME/dotfiles/fonts" "$HOME/.local/share/fonts"