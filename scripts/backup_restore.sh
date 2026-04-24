#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

source="/run/media/$(whoami)/backup/backup.tar.gz"

gum spin \
	--title="Mounting device..." \
	--show-error="true" \
	-- udiskie-mount --all

gum spin \
	--title="Restoring backup from ${source}..." \
	--show-error="true" \
	-- tar -xzf "${source}" -C "${HOME}"

gum spin \
	--title="Syncing cached writes to persistent storage" \
	--show-error="true" \
	-- sync

gum spin \
	--title="Unmounting device..." \
	--show-error="true" \
	-- udiskie-umount --all

echo "✓ Backup successfully restored from ${source}"
