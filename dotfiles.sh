#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

export DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

source "${DOTFILES_DIR}/.internal/dependencies.sh"

main() {
	check_dependencies
}

main "$@"
