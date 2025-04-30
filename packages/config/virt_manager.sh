sudo gpasswd -a $(whoami) libvirt

sudo systemctl enable libvirtd.socket

sudo rm -f /etc/libvirt/network.conf
echo 'firewall_backend="iptables"' | sudo tee -a /etc/libvirt/network.conf
