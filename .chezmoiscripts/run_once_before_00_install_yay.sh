#!/bin/bash
set -euo pipefail

if ! command -v yay &>/dev/null; then
	sudo pacman -Syu --noconfirm --needed git base-devel
	rm -rf /tmp/yay
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg --noconfirm -si
	sudo pacman -Rs --noconfirm go
fi
