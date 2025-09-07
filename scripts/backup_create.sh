#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

dest="/run/media/$(whoami)/backup/backup.tar.gz"
backup_files=(
	".config/chromium"
	".local/share/fonts/dank-mono"
	".mozilla/firefox/profiles"
	".ssh"
	"documents"
)

echo "Files to backup:"
for file in "${backup_files[@]}"; do
	echo " - $file"
done

gum spin \
	--title="Creating backup at ${dest}..." \
	--show-error="true" \
	-- tar -czf "${dest}" -C "${HOME}" "${backup_files[@]}"

gum spin \
	--title="Syncing cached writes to persistent storage" \
	--show-error="true" \
	-- sync

echo "✓ Backup successfully created at ${dest}"
