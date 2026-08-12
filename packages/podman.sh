sudo dnf install -y podman podman-compose

sudo systemctl enable --now podman-restart.service
systemctl --user enable --now podman.socket

sudo rm -f /etc/containers/registries.conf.d/00-shortnames.conf

sudo rm -f /etc/containers/registries.conf.d/00-unqualified-search-registries.conf
echo 'unqualified-search-registries = ["docker.io"]' | sudo tee -a /etc/containers/registries.conf.d/00-unqualified-search-registries.conf
