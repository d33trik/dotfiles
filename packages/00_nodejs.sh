yay -S --noconfirm --needed --provides=false nodejs npm

mkdir -p ~/.npm-global

npm config set prefix '~/.npm-global'
