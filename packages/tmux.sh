yay -S --noconfirm --needed tmux

mkdir -p "$HOME/.tmux/plugins"

rm -rf "$HOME/.tmux/plugins/vim-tmux-navigator"
git clone https://github.com/christoomey/vim-tmux-navigator "$HOME/.tmux/plugins/vim-tmux-navigator"
