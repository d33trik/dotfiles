echo_err() {
	gum style --foreground "#FF9580" "$1"
}

echo_info() {
	gum style --foreground "#80FFEA" "$1"
}

echo_muted(){
	gum style --italic --foreground "#414D58" "$1"
}

echo_success() {
	gum style --foreground "#8AFF80" "$1"
}

echo_text(){
	gum style --foreground "#F8F8F2" "$1"
}
