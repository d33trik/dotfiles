#!/bin/bash
set -euo pipefail

sudo gpasswd -a $(whoami) libvirt
sudo systemctl enable libvirtd.socket
echo 'firewall_backend="iptables"' | sudo tee -a /etc/libvirt/network.conf
