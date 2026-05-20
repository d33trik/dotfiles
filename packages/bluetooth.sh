yay -S --noconfirm --needed --provides=false bluez bluez-utils

sudo systemctl enable --now bluetooth.service
