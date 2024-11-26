#!/bin/bash
set -euo pipefail

sudo systemctl enable podman-restart.service
sudo rm -f /etc/containers/registries.conf.d/00-shortnames.conf
echo 'unqualified-search-registries = ["docker.io"]' | sudo tee -a /etc/containers/registries.conf.d/00-unqualified-search-registries.conf
