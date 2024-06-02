#!/bin/bash
set -euo pipefail

# alacritty
rm -rf "$HOME/.config/alacritty"
ln -sf "$HOME/dotfiles/alacritty" "$HOME/.config/alacritty"