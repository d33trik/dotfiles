check_dependencies() {
	local required_deps=("gum" "yay")
	local missing_deps=()

	for dep in "${required_deps[@]}"; do
		if ! command -v "$dep" &>/dev/null; then
			missing_deps+=("$dep")
		fi
	done

	if (( ${#missing_deps[@]} > 0 )); then
		echo "Missing required dependencies: ${missing_deps[*]}"
		exit 1
	fi
}
