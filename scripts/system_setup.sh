#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

set_tmp_cleanup() {
	echo "d /tmp 1777 root root 0" | sudo tee /etc/tmpfiles.d/tmp.conf > /dev/null
	echo "/tmp cleanup configured."
}

main() {
	set_tmp_cleanup
	echo "System setup configured."
}

main "$@"
