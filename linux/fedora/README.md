# Fedora Setup Guide

Complete guide for setting up Fedora Linux.

## Installation

### Quick Install

```bash
git clone https://github.com/onurguven/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Manual Install

```bash
make core    # Shell + Git
make tools   # CLI tools
```

## Package Installation

### DNF Packages

```bash
cd ~/dotfiles/linux/fedora
sudo dnf install $(grep -v '^#' packages.txt | grep -v '^$' | tr '\n' ' ')
```

Or install manually:

```bash
# Modern CLI tools
sudo dnf install -y eza bat fd-find zoxide git-delta tilix

# Oh-My-Posh (shell prompt)
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

# System
sudo dnf install -y gnome-tweaks

# Zsh
sudo dnf install -y zsh
chsh -s $(which zsh)
```

### Flatpak Applications

```bash
# Enable Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install all apps
cd ~/dotfiles/linux/fedora
flatpak install flathub $(grep -v '^#' flatpaks.txt | grep -v '^$' | tr '\n' ' ')
```

Applications included:
- Beekeeper Studio (Database)
- Redis Insight
- Notion
- OnlyOffice
- Mousai (Music recognition)
- Spotify
- Discord
- Mullvad VPN
- Extension Manager

## Post-Install

### 1. Configure Git

```bash
cp ~/dotfiles/git/.gitconfig.local.example ~/.gitconfig.local
nano ~/.gitconfig.local
```

### 2. Setup SSH

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
cat ~/.ssh/id_ed25519.pub
# Add to GitHub

cp ~/dotfiles/ssh/config.example ~/.ssh/config
chmod 600 ~/.ssh/config
```

### 3. Set Zsh as Default

```bash
chsh -s $(which zsh)
# Log out and back in
```

## Terminal Fonts

Install Nerd Fonts for icons:

```bash
mkdir -p ~/.local/share/fonts

# Download JetBrains Mono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv
```

## GNOME Configuration

### Apply GNOME Settings

```bash
make gnome
```

This applies:
- Fast key repeat
- Tap to click
- Dark theme
- Show hidden files in Nautilus
- Privacy settings

### GNOME Extensions

Install Extension Manager from Flatpak, then install:

- **AATWS** - Advanced Alt-Tab Switcher
- **Dash to Panel** - Taskbar
- **Tiling Shell** - Window tiling
- **AppIndicator** - System tray support
- **Brightness Control using ddcutil** - External monitor brightness
- **Smart Home** - Home Assistant integration

Extension IDs are listed in `extensions.txt`