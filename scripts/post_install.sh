#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

main() {
	local DOTFILES_DIR="$HOME/dotfiles"

	echo "Plug in your backup USB drive before proceeding."
	read -r -p "Ready? (y/N) " reply
	case "${reply,,}" in
	y | yes) ;;
	*) exit 1 ;;
	esac

	post_install
}

post_install() {
	cd "$DOTFILES_DIR"
	git remote set-url origin git@github.com:d33trik/dotfiles.git
	bash scripts/system_setup.sh
	bash scripts/home_dirs_setup.sh
	bash scripts/packages_install.sh
	bash scripts/backup_restore.sh
	bash scripts/gnome_settings.sh
	bash scripts/repos_clone.sh
}

main "$@"
