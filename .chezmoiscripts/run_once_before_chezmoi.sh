#!/bin/bash
set -euo pipefail

cd ~/.local/share/chezmoi/
git remote set-url origin git@github.com:d33trik/dotfiles.git
