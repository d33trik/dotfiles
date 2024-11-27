#!/bin/bash
set -euo pipefail

rm -rf ~/.local/share/architect
git clone https://github.com/d33trik/architect.git ~/.local/share/architect
cd ~/.local/share/architect/
git remote set-url origin git@github.com:d33trik/architect.git
sudo ln -sf ~/.local/share/architect/architect.sh /usr/bin/architect
