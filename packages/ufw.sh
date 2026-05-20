bash -c "yes | yay -S --needed iptables-nft ufw"

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo systemctl enable --now ufw.service

sudo ufw enable
