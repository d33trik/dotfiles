#!/bin/bash

set -euo pipefail

CODEBERG_USER="d33trik"
PROJECTS_DIR="$HOME/projects"

main() {
	install_deps
	create_projects_directory "$PROJECTS_DIR"
	clone_repositories "$CODEBERG_USER" "$PROJECTS_DIR"
}

install_deps() {
	echo "Installing dependencies..."
	sudo pacman -S --noconfirm --needed git curl jq >/dev/null 2>&1 || echo "Failed to install dependencies"
}

create_projects_directory() {
	mkdir -p "$1"
}

clone_repositories() {
	local user="$1"
	local base_dir="$2"

	echo "Fetching repos from $user on Codeberg..."

	local page=1
	local repos=()

	while true; do
		local response
		response=$(curl -s "https://codeberg.org/api/v1/users/$user/repos?limit=50&page=$page")

		local length
		length=$(echo "$response" | jq 'length')

		[[ "$length" -eq 0 ]] && break

		while IFS= read -r url; do
			repos+=("$url")
		done < <(echo "$response" | jq -r '.[].ssh_url')

		((page++))
	done

	for repo_url in "${repos[@]}"; do
		local repo_name

		repo_name=$(basename "$repo_url" .git)
		[[ "$repo_name" == "dotfiles" ]] && continue
		local repo_path="$base_dir/$repo_name"

		if [[ -d "$repo_path" ]]; then
			echo "Skipping $repo_name (already exists)..."
		else
			echo "Cloning $repo_name..."
			git clone "$repo_url" "$repo_path" >/dev/null 2>&1 || echo "Error: failed to clone $repo_name"
		fi
	done
}

main "$@"
