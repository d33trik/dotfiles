set -euo pipefail

sudo pacman -S --noconfirm --needed bluez bluez-utils
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
