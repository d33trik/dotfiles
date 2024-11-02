#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

export DOTFILES_DEBUG=0
export DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

source "${DOTFILES_DIR}/.internal/dependencies.sh"
source "${DOTFILES_DIR}/.internal/gum_style.sh"

main() {
	local action

	parse_args "$@"
	check_dependencies
	display_menu
	execute_action
}

parse_args() {
	while [[ $# -gt 0 ]]; do
		case "$1" in
			--debug)
				export DOTFILES_DEBUG=1
				shift
				;;
			*)
				shift
				;;
		esac
	done
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

execute_action() {
	case "$action" in
		"Apply settings")
			echo "Applying settings..."
			;;
		"Install packages")
			bash "${DOTFILES_DIR}/.internal/install_packages.sh"
			;;
		"Exit")
			exit 0
			;;
	esac
}

main "$@"
