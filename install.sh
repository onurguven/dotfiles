#!/usr/bin/env bash

# Dotfiles Bootstrap Script
# =========================
# Quick installation script with OS detection

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Functions
info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# OS Detection
detect_os() {
    case "$(uname -s)" in
        Darwin*)
            echo "macos"
            ;;
        Linux*)
            if [ -f /etc/fedora-release ]; then
                echo "fedora"
            elif [ -f /etc/debian_version ]; then
                echo "debian"
            else
                echo "linux"
            fi
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

# Check if command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Install Zimfw
install_zimfw() {
    local zim_home="${HOME}/.zim"
    if [[ ! -d "$zim_home" ]]; then
        info "Installing Zimfw..."
        curl -fsSL --create-dirs -o "${zim_home}/zimfw.zsh" \
            https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    else
        info "Zimfw already installed"
    fi
}

# Install Homebrew (macOS)
install_homebrew() {
    if ! command_exists brew; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add to PATH for current session
        if [[ -d "/opt/homebrew/bin" ]]; then
            export PATH="/opt/homebrew/bin:$PATH"
        fi
    else
        info "Homebrew already installed"
    fi
}

# Main
main() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║       Dotfiles Installation            ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""

    local os=$(detect_os)
    info "Detected OS: $os"
    info "Dotfiles directory: $DOTFILES_DIR"
    echo ""

    # Install Zimfw
    install_zimfw

    case "$os" in
        macos)
            install_homebrew
            info "Running: make macos"
            make -C "$DOTFILES_DIR" macos
            ;;
        fedora)
            info "Running: make fedora"
            make -C "$DOTFILES_DIR" fedora
            ;;
        *)
            info "Running: make core"
            make -C "$DOTFILES_DIR" core
            ;;
    esac

    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║       Installation Complete!           ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
    echo ""

    warn "Don't forget to:"
    echo "  1. Create ~/.gitconfig.local with your user info"
    echo "  2. Copy SSH config: cp ~/dotfiles/ssh/config.example ~/.ssh/config"
    echo "  3. Restart your terminal or run: source ~/.zshrc"
    echo ""
}

# Run
main "$@"
