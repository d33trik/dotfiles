yay -S --noconfirm --needed --provides=false \
	bluez \
	bluez-utils

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
