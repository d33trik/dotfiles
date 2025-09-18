yay -S --noconfirm --needed \
	nodejs \
	npm

mkdir -p ~/.npm-global

npm config set prefix '~/.npm-global'
