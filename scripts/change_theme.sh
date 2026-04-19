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
	change_dunst_theme "$theme"
}

change_alacritty_theme() {
	readonly ALACRITTY_CONFIG="$HOME/dotfiles/.config/alacritty/alacritty.toml"
	local theme="$1"

	sed -i "s|~/.config/alacritty/themes/[^\"]*\.toml|~/.config/alacritty/themes/${theme}.toml|g" "$ALACRITTY_CONFIG"
}

change_dunst_theme() {
	readonly DUNST_CONFIG="$HOME/dotfiles/.config/dunst/dunstrc"
	readonly DUNST_THEMES_DIR="$HOME/dotfiles/.config/dunst/themes"
	local theme="$1"
	local theme_file="$DUNST_THEMES_DIR/${theme}.dunstrc"

	if [[ ! -f "$theme_file" ]]; then
		echo "Error: theme file '$theme_file' not found" >&2
		return 1
	fi

	sed -i '/^\[urgency_/,/^$/d' "$DUNST_CONFIG"

	cat "$theme_file" >>"$DUNST_CONFIG"

	pkill dunst || true
	dunst &
}

main "$@"
