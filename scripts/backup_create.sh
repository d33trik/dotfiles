#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

dest="/run/media/$(whoami)/backup/backup.tar.gz"
backup_files=(
	".config/chromium"
	".config/mozilla/firefox"
	".local/share/applications"
	".local/share/fonts/dank-mono"
	".ssh"
	".wallpapers"
	"documents"
)

echo "Files to backup:"
for file in "${backup_files[@]}"; do
	echo " - $file"
done

echo "Creating backup at ${dest}..."
tar -czf "${dest}" -C "${HOME}" "${backup_files[@]}"

echo "Syncing cached writes to persistent storage..."
sync

echo "✓ Backup successfully created at ${dest}"
