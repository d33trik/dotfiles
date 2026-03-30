yay -S --noconfirm --needed --provides=false \
	qemu-full \
	libvirt \
	virt-manager \
	iptables-nft \
	dnsmasq \
	dmidecode \
	edk2-ovmf

sudo gpasswd -a $(whoami) libvirt

sudo systemctl enable libvirtd.socket

sudo rm -f /etc/libvirt/network.conf
echo 'firewall_backend="iptables"' | sudo tee -a /etc/libvirt/network.conf
