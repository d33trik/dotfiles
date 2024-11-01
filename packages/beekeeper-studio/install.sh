set -euo pipefail

sudo pacman -S --noconfirm --needed fuse2
cd /tmp
curl -sLo beekeeper-studio.AppImage $(curl -s https://api.github.com/repos/beekeeper-studio/beekeeper-studio/releases/latest | grep browser_download_url.*AppImage | grep -v "arm64" | cut -d\" -f4)
sudo mkdir -p /opt/beekeeper-studio
sudo mv beekeeper-studio.AppImage /opt/beekeeper-studio
sudo chmod +x /opt/beekeeper-studio/beekeeper-studio.AppImage
sudo ln -sf /opt/beekeeper-studio/beekeeper-studio.AppImage /usr/bin/beekeeper-studio
