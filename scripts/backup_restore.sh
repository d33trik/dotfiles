#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

source="/run/media/$(whoami)/backup/backup.tar.gz"

echo "Restoring backup from ${source}..."
tar -xzf "${source}" -C "${HOME}"

echo "Syncing cached writes to persistent storage..."
sync

echo "✓ Backup successfully restored from ${source}"
