run_cmd() {
	local cmd="$1"

	if ! eval "$cmd" &>/dev/null; then
		return 1
	fi

	return 0
}

clear_line() {
	tput cuu1 && tput el
}
