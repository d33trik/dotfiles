#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

source "${DOTFILES_DIR}/.internal/fmt.sh"
source "${DOTFILES_DIR}/.internal/utils.sh"

main() {
	readonly PACKAGES_DIR="${DOTFILES_DIR}/packages"

	check_packages_dir
	request_sudo_privileges
	synchronize_package_databases
	install_packages
}

check_packages_dir(){
	if [ ! -d "$PACKAGES_DIR" ]; then
		echo_err "✗ Directory ${PACKAGES_DIR} does not exist"
		exit 1
	fi

	if [ -z "$(ls -A "$PACKAGES_DIR")" ]; then
		echo_err "✗ Directory ${PACKAGES_DIR} is empty"
		exit 1
	fi
}

request_sudo_privileges() {
	if ! sudo -n true 2>/dev/null; then
		echo_text "Requesting sudo privileges..."
		tput sc
		if ! sudo -v; then
			echo_err "✗ Failed to obtain sudo privileges"
			exit 1
		fi
		tput rc && tput ed
	fi

	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
}

synchronize_package_databases() {
	echo_text "Synchronizing package databases..."
	if ! run_cmd "sudo pacman -Sy"; then
		echo_err "✗ Failed to synchronize package databases"
		exit 1
	fi
}

install_packages() {
	echo_text "Installing packages..."
	for package_dir in "${PACKAGES_DIR}"/*/; do
		local package=$(basename "$package_dir")

		if check_package "$package_dir" "$package"; then
			continue
		fi

		install_package "$package_dir" "$package"
	done
}

check_package() {
	local package_dir=$1
	local package=$2

	if [[ ! -f "${package_dir}check.sh" ]]; then
		echo_err "✗ Check script not found for package $package"
		exit 1
	fi
	
	if run_cmd "bash ${package_dir}check.sh"; then
		echo_muted "✓ ${package} [already installed]"
		return 0
	fi

	return 1
}

install_package() {
	local package_dir=$1
	local package=$2

	echo_info "Installing ${package}..."

	if [[ ! -f "${package_dir}install.sh" ]]; then
		echo_err "✗ Install script not found for package $package"
		exit 1
	fi

	if ! run_cmd "bash ${package_dir}install.sh"; then
		echo_err "✗ Failed to install ${package}"
		exit 1
	fi

	clear_line
	echo_success "✓ ${package} [installed]"
}

main "$@"
