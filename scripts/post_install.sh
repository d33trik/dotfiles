#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

main() {
	local DOTFILES_DIR="$HOME/dotfiles"

	post_install
}

post_install() {
	cd "$DOTFILES_DIR"
	git remote set-url origin ssh://git@codeberg.org/d33trik/dotfiles.git
	bash scripts/install_packages.sh
}

main "$@"
