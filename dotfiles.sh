#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

export DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

source "${DOTFILES_DIR}/.internal/dependencies.sh"

main() {
	local action

	check_dependencies
	display_menu
}

display_menu() {
	local options=(
		"Apply settings"
		"Install packages"
		"Exit"
	)

	action=$(
		printf "%s\n" "${options[@]}" |
		gum choose \
			--header="Dotfiles!"
	)
}

main "$@"
