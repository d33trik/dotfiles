#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

main() {
	install_git
	clone_repository
	setup_dotfiles_command
}

install_git() {
	echo "Installing git..."
	sudo pacman -S --noconfirm --needed git
}

clone_repository() {
	echo "Cloning repository..."
	rm -rf "${HOME}/.dotfiles"
	git clone "https://github.com/d33trik/dotfiles.git" "${HOME}/.dotfiles"
}

setup_dotfiles_command() {
	echo "Setting up dotfiles command..."
	chmod +x "${HOME}/.dotfiles/dotfiles.sh"
	sudo sudo ln -sf "${HOME}/.dotfiles/dotfiles.sh" "/usr/bin/dotfiles"
}

main "$@"
