#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

declare -A DIR_MAP=(
	[Desktop]="desktop"
	[Documents]="documents"
	[Downloads]="downloads"
	[Music]="music"
	[Pictures]="pictures"
	[Templates]="templates"
	[Public]="public"
	[Videos]="videos"
)

declare -A XDG_KEYS=(
	[Desktop]="DESKTOP"
	[Documents]="DOCUMENTS"
	[Downloads]="DOWNLOAD"
	[Music]="MUSIC"
	[Pictures]="PICTURES"
	[Templates]="TEMPLATES"
	[Public]="PUBLICSHARE"
	[Videos]="VIDEOS"
)

rename_dirs() {
	for old in "${!DIR_MAP[@]}"; do
		new="${DIR_MAP[$old]}"
		if [[ -d "$HOME/$old" && ! -d "$HOME/$new" ]]; then
			mv "$HOME/$old" "$HOME/$new"
			echo "Renamed ~/$old -> ~/$new"
		fi
	done
}

update_xdg() {
	for old in "${!DIR_MAP[@]}"; do
		new="${DIR_MAP[$old]}"
		key="${XDG_KEYS[$old]}"
		if [[ -d "$HOME/$new" ]]; then
			xdg-user-dirs-update --set "$key" "$HOME/$new"
		fi
	done
	echo "XDG user dirs updated."
}

set_default_icons() {
	for new in "${DIR_MAP[@]}"; do
		if [[ -d "$HOME/$new" ]]; then
			gio set -t string "$HOME/$new" metadata::custom-icon-name "folder"
		fi
	done
	echo "Folder icons set to default."
}

rename_dirs
update_xdg
set_default_icons
