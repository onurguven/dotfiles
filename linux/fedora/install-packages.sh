#!/usr/bin/env bash

# Fedora Package Installation
# ===========================

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { printf "${GREEN}[INFO]${NC} %s\n" "$1"; }
warn() { printf "${YELLOW}[WARN]${NC} %s\n" "$1"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# DNF packages
info "Installing DNF packages..."
sudo dnf install -y --skip-unavailable \
    zsh git gh \
    bat fd-find fzf zoxide git-delta \
    jq yq tree wget curl htop tldr \
    tilix podman gnome-tweaks

# Oh-My-Posh (official install script)
info "Installing Oh-My-Posh..."
if ! command -v oh-my-posh &>/dev/null; then
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
fi

# fnm (Fast Node Manager)
info "Installing fnm..."
if ! command -v fnm &>/dev/null; then
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fi

# eza via COPR (not in Fedora 42+ repos)
info "Installing eza..."
if ! command -v eza &>/dev/null; then
    sudo dnf copr enable -y alternateved/eza
    sudo dnf install -y eza
fi

# Mullvad VPN via official repo
info "Installing Mullvad VPN..."
if ! command -v mullvad &>/dev/null; then
    sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
    sudo dnf install -y mullvad-vpn
fi

# Notion Electron (unofficial Linux client)
info "Installing Notion Electron..."
if ! rpm -q notion-electron &>/dev/null; then
    NOTION_VERSION=$(curl -sL https://github.com/anechunaev/notion-electron/releases/latest/download/latest-linux.yml | grep "^version:" | cut -d' ' -f2)
    NOTION_RPM=$(mktemp --suffix=.rpm)
    curl -L -o "$NOTION_RPM" "https://github.com/anechunaev/notion-electron/releases/download/v${NOTION_VERSION}/Notion_Electron-${NOTION_VERSION}-x86_64.rpm"
    sudo dnf install -y "$NOTION_RPM"
    rm -f "$NOTION_RPM"
fi

info "DNF packages installed!"
