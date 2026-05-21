#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

main() {
	local DOTFILES_DIR="$HOME/dotfiles"

	synchronize_package_databases
	install_yay
	install_packages
	apply_dotfiles
}

synchronize_package_databases() {
	sudo pacman -Sy
}

install_yay() {
	if ! command -v yay &>/dev/null; then
		sudo pacman -S --noconfirm --needed git base-devel
		rm -rf /tmp/yay
		git clone https://aur.archlinux.org/yay.git /tmp/yay
		cd /tmp/yay
		makepkg --noconfirm -si
		sudo pacman -Rs --noconfirm go
	fi
}

install_packages() {
	local packages_dir="$DOTFILES_DIR/packages"

	for package in "$packages_dir"/*.sh; do
		if [ -f "$package" ]; then
			bash "$package"
		fi
	done
}

apply_dotfiles() {
	cd "$DOTFILES_DIR"
	stow .
}

main "$@"
