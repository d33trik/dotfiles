#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

main() {
	install_distrobox
	setup_dir
	create_container
	install_packages
}

install_distrobox() {
	sudo dnf install -y distrobox
}

setup_dir() {
	mkdir -p "$HOME/workstation"
	git clone https://github.com/claudiodietrich/dotfiles.git "$HOME/workstation/dotfiles"
}

create_container() {
	distrobox create \
		--yes \
		--name workstation \
		--hostname workstation \
		--home "$HOME/workstation" \
		--image fedora:latest
}

install_packages() {
	distrobox-enter \
		--name workstation \
		-- bash "$HOME/workstation/dotfiles/scripts/post_install.sh"
}

main "$@"
