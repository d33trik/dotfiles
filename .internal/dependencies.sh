check_dependencies() {
	local required_deps=("gum" "yay")
	local missing_deps=()

	for dep in "${required_deps[@]}"; do
		if ! command -v "$dep" &>/dev/null; then
			missing_deps+=("$dep")
		fi
	done

	if (( ${#missing_deps[@]} > 0 )); then
		echo "Installing missing dependencies: ${missing_deps[*]}"

		for missing_dep in "${missing_deps[@]}"; do
			echo "Installing ${missing_dep}..."
			install_"$missing_dep"
		done

		clear
	fi
}

install_gum() {
	sudo pacman -S --noconfirm --needed gum
}

install_yay() {
	sudo pacman -S --noconfirm --needed git base-devel
	cd /tmp
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg --noconfirm -si
	sudo pacman -Rs --noconfirm go
}
