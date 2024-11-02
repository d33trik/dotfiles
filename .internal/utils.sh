run_cmd() {
	local cmd="$1"

	if [[ "${DOTFILES_DEBUG:-0}" == "1" ]]; then
		eval "$cmd"
	else
		eval "$cmd" &>/dev/null
	fi

	return $?
}

clear_line() {
	tput cuu1 && tput el
}
