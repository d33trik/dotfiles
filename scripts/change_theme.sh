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
	change_lualine_theme "$theme"
	change_starship_theme "$theme"
	change_tmux_theme "$theme"
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

change_lualine_theme() {
	readonly NVIM_LUALINE="$HOME/dotfiles/.config/nvim/lua/plugins/lualine.lua"
	readonly LUALINE_THEMES_DIR="$HOME/dotfiles/.config/nvim/themes/lualine"
	local theme="$1"
	local theme_file="$LUALINE_THEMES_DIR/${theme}"

	if [[ ! -f "$theme_file" ]]; then
		echo "Error: theme file '$theme_file' not found" >&2
		return 1
	fi

	while IFS='=' read -r key value; do
		sed -i "s|nvim_set_hl(0, \"${key}\", { fg = \"[^\"]*\" })|nvim_set_hl(0, \"${key}\", { fg = ${value} })|" "$NVIM_LUALINE"
	done <"$theme_file"
}

change_starship_theme() {
	readonly STARSHIP_CONFIG="$HOME/dotfiles/.config/starship/starship.toml"
	readonly STARSHIP_THEMES_DIR="$HOME/dotfiles/.config/starship/themes"
	local theme="$1"
	local theme_file="$STARSHIP_THEMES_DIR/${theme}.toml"

	if [[ ! -f "$theme_file" ]]; then
		echo "Error: theme file '$theme_file' not found" >&2
		return 1
	fi

	local directory_style
	directory_style=$(grep '^directory_style' "$theme_file" | cut -d'"' -f2)

	local directory_read_only_style
	directory_read_only_style=$(grep '^directory_read_only_style' "$theme_file" | cut -d'"' -f2)

	local git_branch_style
	git_branch_style=$(grep '^git_branch_style' "$theme_file" | cut -d'"' -f2)

	local git_state_style
	git_state_style=$(grep '^git_state_style' "$theme_file" | cut -d'"' -f2)

	local git_status_style
	git_status_style=$(grep '^git_status_style' "$theme_file" | cut -d'"' -f2)

	local character_success
	character_success=$(grep '^character_success' "$theme_file" | head -1 | cut -d'"' -f2)

	local character_error
	character_error=$(grep '^character_error' "$theme_file" | head -1 | cut -d'"' -f2)

	local character_vimcmd
	character_vimcmd=$(grep '^character_vimcmd' "$theme_file" | head -1 | cut -d'"' -f2)

	local character_vimcmd_visual
	character_vimcmd_visual=$(grep '^character_vimcmd_visual' "$theme_file" | head -1 | cut -d'"' -f2)

	local character_vimcmd_replace
	character_vimcmd_replace=$(grep '^character_vimcmd_replace' "$theme_file" | head -1 | cut -d'"' -f2)

	local character_vimcmd_replace_one
	character_vimcmd_replace_one=$(grep '^character_vimcmd_replace_one' "$theme_file" | head -1 | cut -d'"' -f2)

	sed -i "/^\[directory\]/,/^\[/ s|^style = '.*'|style = '${directory_style}'|" "$STARSHIP_CONFIG"
	sed -i "/^\[directory\]/,/^\[/ s|^read_only_style = '.*'|read_only_style = '${directory_read_only_style}'|" "$STARSHIP_CONFIG"
	sed -i "/^\[git_branch\]/,/^\[/ s|^style = '.*'|style = '${git_branch_style}'|" "$STARSHIP_CONFIG"
	sed -i "/^\[git_state\]/,/^\[/ s|^style = '.*'|style = '${git_state_style}'|" "$STARSHIP_CONFIG"
	sed -i "/^\[git_status\]/,/^\[/ s|^style = '.*'|style = '${git_status_style}'|" "$STARSHIP_CONFIG"

	sed -i '/success_symbol/ s/(#[a-fA-F0-9]\{6\})/('"$character_success"')/g' "$STARSHIP_CONFIG"
	sed -i '/error_symbol/ s/(#[a-fA-F0-9]\{6\})/('"$character_error"')/g' "$STARSHIP_CONFIG"
	sed -i '/vimcmd_visual_symbol/ s/(#[a-fA-F0-9]\{6\})/('"$character_vimcmd_visual"')/g' "$STARSHIP_CONFIG"
	sed -i '/vimcmd_replace_one_symbol/ s/(#[a-fA-F0-9]\{6\})/('"$character_vimcmd_replace_one"')/g' "$STARSHIP_CONFIG"
	sed -i '/vimcmd_replace_symbol/ s/(#[a-fA-F0-9]\{6\})/('"$character_vimcmd_replace"')/g' "$STARSHIP_CONFIG"
	sed -i '/vimcmd_symbol/ s/(#[a-fA-F0-9]\{6\})/('"$character_vimcmd"')/g' "$STARSHIP_CONFIG"
}

change_tmux_theme() {
	readonly TMUX_CONFIG="$HOME/dotfiles/.config/tmux/tmux.conf"
	readonly TMUX_THEMES_DIR="$HOME/dotfiles/.config/tmux/themes"
	local theme="$1"
	local theme_file="$TMUX_THEMES_DIR/${theme}.tmuxtheme"

	if [[ ! -f "$theme_file" ]]; then
		echo "Error: theme file '$theme_file' not found" >&2
		return 1
	fi

	local status_bg
	status_bg=$(grep '^status_bg' "$theme_file" | cut -d'"' -f2)

	local status_fg
	status_fg=$(grep '^status_fg' "$theme_file" | cut -d'"' -f2)

	local active_fg
	active_fg=$(grep '^active_fg' "$theme_file" | cut -d'"' -f2)

	sed -i "/status-style/ s|bg='#[^']*'|bg='${status_bg}'|" "$TMUX_CONFIG"
	sed -i "/status-style/ s|fg='#[^']*'|fg='${status_fg}'|" "$TMUX_CONFIG"
	sed -i "/window-status-current-format/ s|fg=#[a-fA-F0-9]\{6\}|fg=${active_fg}|g" "$TMUX_CONFIG"
	sed -i "/status-right/ s|fg=#[a-fA-F0-9]\{6\}|fg=${active_fg}|g" "$TMUX_CONFIG"

	tmux source "$TMUX_CONFIG" 2>/dev/null || true
}

main "$@"
