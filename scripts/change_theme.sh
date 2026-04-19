#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

readonly THEMES=(
	"tokyonight-day"
	"tokyonight-moon"
	"tokyonight-night"
	"tokyonight-storm"
)

main() {
	local theme
	theme=$(gum choose "${THEMES[@]}")

	change_alacritty_theme "$theme"
}

change_alacritty_theme() {
	readonly ALACRITTY_CONFIG="$HOME/dotfiles/.config/alacritty/alacritty.toml"
	local theme="$1"

	sed -i "s|~/.config/alacritty/themes/[^\"]*\.toml|~/.config/alacritty/themes/${theme}.toml|g" "$ALACRITTY_CONFIG"
}

main "$@"
