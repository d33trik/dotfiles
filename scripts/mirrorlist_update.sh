#!/bin/bash

# e - script stops on error
# u - error if undefined variable
# o pipefail - script fails if command piped fails
set -euo pipefail

mirrorlist_country_code="BR"
mirrorlist_url="https://archlinux.org/mirrorlist/?country=$mirrorlist_country_code&protocol=http&protocol=https&ip_version=4&use_mirror_status=on"

# Ask for sudo password
sudo -v

gum spin \
	--title="Installing pacman-contrib..." \
	--show-error="true" \
	-- sudo sh -c "pacman -S --noconfirm --needed pacman-contrib"

gum spin \
	--title="Downloading mirrorlist..." \
	--show-error="true" \
	-- sudo sh -c "curl -s '$mirrorlist_url' > /etc/pacman.d/mirrorlist.unranked"

# Remove comments and enable servers
sudo sh -c "sed '/^##/d; /^[[:space:]]*$/d; s/^#Server/Server/' /etc/pacman.d/mirrorlist.unranked > /etc/pacman.d/mirrorlist.tmp"

# Replace the unranked with the clear one
sudo sh -c "mv /etc/pacman.d/mirrorlist.tmp /etc/pacman.d/mirrorlist.unranked"

gum spin \
	--title="Ranking mirrors..." \
	--show-error="true" \
	-- sudo sh -c "rankmirrors -n 5 /etc/pacman.d/mirrorlist.unranked > /etc/pacman.d/mirrorlist"

# Remove the unranked mirrorlist
sudo sh -c "rm /etc/pacman.d/mirrorlist.unranked"

echo "✓ The mirrorlist was successfully updated"
