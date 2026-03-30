bash -c "yes | yay -S --needed networkmanager iptables-nft ufw gufw"

yay -S --noconfirm --needed --provides=false openssh

sudo systemctl enable NetworkManager.service
sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw enable
