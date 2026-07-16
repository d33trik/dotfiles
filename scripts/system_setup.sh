#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

set_tmp_cleanup() {
	echo "D /tmp 1777 root root 0" | sudo tee /etc/tmpfiles.d/tmp.conf >/dev/null
	echo "/tmp cleanup configured."
}

set_downloads_cleanup() {
	echo "D $HOME/downloads 0755 $USER $USER -" | sudo tee /etc/tmpfiles.d/downloads.conf >/dev/null
	echo "$HOME/downloads cleanup configured."
}

main() {
	set_tmp_cleanup
	set_downloads_cleanup
	echo "System setup configured."
}

main "$@"
