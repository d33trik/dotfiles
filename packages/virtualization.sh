sudo dnf group install -y virtualization

sudo usermod -a -G libvirt $(whoami)

sudo systemctl enable --now libvirtd