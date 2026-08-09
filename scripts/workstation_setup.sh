#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

main() {
	local DOTFILES_DIR="$HOME/dotfiles"

	install_toolbox
	create_container
	install_packages
}

install_toolbox() {
	sudo dnf install -y toolbox
}

create_container() {
	toolbox create workstation
	toolbox run --container workstation sudo hostname workstation
}

install_packages() {
	local packages_dir="$DOTFILES_DIR/packages/workstation"

	for package in "$packages_dir"/*.sh; do
		if [ -f "$package" ]; then
			toolbox run --container workstation bash "$package"
		fi
	done
}

main "$@"
