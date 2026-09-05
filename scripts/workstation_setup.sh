#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

main() {
	install_distrobox
	create_container
	install_packages
}

install_distrobox() {
	sudo dnf install -y distrobox
}

create_container() {
	distrobox create \
		--yes \
		--name workstation \
		--hostname workstation \
		--home "/mnt/workstation/fedora" \
		--image fedora:latest
}

install_packages() {
	distrobox-enter \
		--name workstation \
		-- bash "/mnt/workstation/fedora/dotfiles/scripts/post_install.sh"
}

main "$@"
