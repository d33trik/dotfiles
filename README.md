# My Dotfiles

This repository contains my personal configuration files for various applications and tools.

## Installation

The installation process is automated using a script designed for Arch-based distributions.

**Warning:** The installation script will install packages and modify your system configuration.

1. **Clone the repository:**
```bash
git clone https://github.com/d33trik/dotfiles.git ~/dotfiles
```

2. **Run the installation script:**
```bash
bash ~/dotfiles/packages/install.sh
```

The script will:
- Synchronize `pacman` package databases.
- Install `yay` if it's not already installed.
- Install all the packages listed in `packages/packages.yaml`.
- Run post-installation configuration scripts.
- Apply the dotfiles using `stow`.
