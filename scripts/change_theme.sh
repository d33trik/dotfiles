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
	change_fish_theme "$theme"
	change_i3_theme "$theme"
	change_neovim_theme "$theme"
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

change_fish_theme() {
	readonly FISH_CONFIG="$HOME/dotfiles/.config/fish/config.fish"
	local theme="$1"

	sed -i "s|fish_config theme choose .*|fish_config theme choose ${theme}|" "$FISH_CONFIG"
}

change_i3_theme() {
	readonly I3_CONFIG="$HOME/dotfiles/.config/i3/config"
	readonly I3STATUS_CONFIG="$HOME/dotfiles/.config/i3/i3status.conf"
	readonly I3_THEMES_DIR="$HOME/dotfiles/.config/i3/themes"
	local theme="$1"
	local i3_theme_file="$I3_THEMES_DIR/${theme}.i3theme"
	local i3status_theme_file="$I3_THEMES_DIR/${theme}.i3status"

	if [[ ! -f "$i3_theme_file" ]]; then
		echo "Error: theme file '$i3_theme_file' not found" >&2
		return 1
	fi

	if [[ ! -f "$i3status_theme_file" ]]; then
		echo "Error: theme file '$i3status_theme_file' not found" >&2
		return 1
	fi

	sed -i "/^# Colors$/,/^set \$red/{
        /^# Colors$/r $i3_theme_file
        d
    }" "$I3_CONFIG"

	sed -i "s/color_good=\"[^\"]*\"/$(grep 'color_good' "$i3status_theme_file")/" "$I3STATUS_CONFIG"
	sed -i "s/color_degraded=\"[^\"]*\"/$(grep 'color_degraded' "$i3status_theme_file")/" "$I3STATUS_CONFIG"
	sed -i "s/color_bad=\"[^\"]*\"/$(grep 'color_bad' "$i3status_theme_file")/" "$I3STATUS_CONFIG"

	i3-msg restart >/dev/null
}

change_neovim_theme() {
	readonly NVIM_OPTIONS="$HOME/dotfiles/.config/nvim/lua/config/options.lua"
	local theme="$1"

	sed -i "s|vim.g.colorscheme = \".*\"|vim.g.colorscheme = \"${theme}\"|" "$NVIM_OPTIONS"
}

main "$@"
