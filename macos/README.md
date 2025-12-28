# macOS Setup Guide

Complete guide for setting up a new macOS machine.

## Prerequisites

1. **Xcode Command Line Tools**
   ```bash
   xcode-select --install
   ```

## Installation

### Quick Install

```bash
git clone https://github.com/onurguven/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This will:
1. Install Zimfw (plugin manager)
2. Install Homebrew
3. Install all packages from Brewfile (including Oh-My-Posh)
4. Configure shell (zsh)
5. Configure git
6. Apply macOS system preferences

### Manual Install

```bash
make homebrew    # Install Homebrew and packages
make core        # Shell + Git
make tools       # CLI tools
make defaults    # macOS preferences
```

## Homebrew Packages

### CLI Tools

| Package | Description |
|---------|-------------|
| zsh | Shell |
| git | Version control |
| gh | GitHub CLI |
| eza | Modern ls |
| bat | Modern cat |
| fd | Modern find |
| zoxide | Smart cd |
| git-delta | Better diffs |
| oh-my-posh | Cross-shell prompt |
| jq | JSON processor |
| tldr | Simplified man |

### Applications

| App | Description |
|-----|-------------|
| iTerm2 | Terminal |
| Visual Studio Code | Editor |
| Raycast | Spotlight replacement |
| BetterTouchTool | Trackpad customization |
| AltTab | App switcher |
| Loop | Window management |
| Ice | Menu bar |
| OrbStack | Docker alternative |
| TablePlus | Database client |
| Figma | Design |
| Waterfox | Browser |
| Discord | Communication |
| Notion | Notes |
| Spotify | Music |
| Mullvad VPN | VPN |

### Fonts

- JetBrains Mono Nerd Font
- Fira Code Nerd Font
- Meslo LG Nerd Font

## System Preferences

Run `make defaults` to apply:

- **Finder**: Show hidden files, extensions, path bar
- **Dock**: Auto-hide, no recent apps, faster animation
- **Keyboard**: Fast key repeat, no auto-correct
- **Trackpad**: Tap to click, three finger drag
- **Screenshots**: Save to ~/Screenshots as PNG

## Post-Install

### 1. Configure Git

```bash
cp ~/dotfiles/git/.gitconfig.local.example ~/.gitconfig.local
code ~/.gitconfig.local
```

Add your name and email.

### 2. Setup SSH

```bash
# Generate new key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Copy public key
cat ~/.ssh/id_ed25519.pub | pbcopy

# Add to GitHub: https://github.com/settings/keys

# Setup config
cp ~/dotfiles/ssh/config.example ~/.ssh/config
chmod 600 ~/.ssh/config
```

### 3. Configure iTerm2

1. Open iTerm2 Preferences
2. Go to Profiles > Colors
3. Import a color scheme (GitHub Dark recommended)
4. Set font to JetBrains Mono Nerd Font

### 4. Configure Raycast

1. Open Raycast
2. Disable Spotlight: System Preferences > Keyboard > Shortcuts > Spotlight
3. Set Raycast hotkey to ⌘ Space

## Troubleshooting

### Homebrew permissions

```bash
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib
```

### Zsh plugins not loading

```bash
cd ~/dotfiles
git submodule update --init --recursive
```

### Reset to defaults

```bash
make clean
```