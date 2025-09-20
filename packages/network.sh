yay -S --noconfirm --needed \
	networkmanager \
	iptables-nft \
	ufw \
	gufw \
	openssh

sudo systemctl enable NetworkManager.service
sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw enable
