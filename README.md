# Dotfiles

Personal dotfiles for macOS and Fedora Linux.

![Shell](https://img.shields.io/badge/Shell-Zsh-green)
![OS](https://img.shields.io/badge/OS-macOS%20%7C%20Fedora-blue)

## Quick Start

```bash
git clone https://github.com/onurguven/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

### Shell (Zsh)

- Modular configuration (options, history, completion, keybindings)
- [Oh-My-Posh](https://ohmyposh.dev) prompt (cross-shell, customizable)
- [Zimfw](https://zimfw.sh) plugin manager (lightweight, fast)
- Plugins:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zsh-you-should-use
  - zsh-completions
  - zsh-history-substring-search

### Git

- Comprehensive aliases (50+)
- Delta for beautiful diffs
- Modular config with includes
- Global gitignore patterns

### Modern CLI Tools

| Tool | Replaces | Description |
|------|----------|-------------|
| [eza](https://github.com/eza-community/eza) | ls | Modern ls with icons |
| [bat](https://github.com/sharkdp/bat) | cat | Syntax highlighting |
| [fd](https://github.com/sharkdp/fd) | find | Fast file finder |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | cd | Smart directory jumping |
| [delta](https://github.com/dandavison/delta) | diff | Beautiful diffs |

### macOS Specific

- Brewfile with all packages and casks
- System defaults configuration

### Fedora Specific

- DNF package list
- Flatpak applications
- GNOME settings and extensions

## Structure

```
dotfiles/
├── shell/              # Shell configurations
│   ├── zsh/            # Zsh config files
│   │   ├── .zimrc      # Zimfw plugin list
│   │   └── ohmyposh.json  # Oh-My-Posh prompt config
│   ├── bash/           # Bash config files
│   └── shared/         # Shared aliases & functions
├── git/                # Git configuration
│   └── config/         # Modular git configs
├── tools/              # CLI tool configs
├── terminal/           # Terminal emulator configs
├── editor/             # Editor settings
├── macos/              # macOS specific (Brewfile, defaults, README)
├── linux/              # Linux specific (Fedora README, packages)
├── ssh/                # SSH config templates
├── bin/                # Custom scripts
├── Makefile            # Installation commands
└── install.sh          # Bootstrap script
```

## Installation Options

```bash
make help           # Show all available targets
make core           # Install shell + git only
make shell          # Shell configuration only
make git            # Git configuration only
make tools          # CLI tools configuration
make macos          # Full macOS installation
make fedora         # Full Fedora installation
make defaults       # Apply macOS system preferences
make homebrew       # Install Homebrew packages
make dnf            # Install DNF packages (Fedora)
make flatpaks       # Install Flatpak apps (Fedora)
make gnome          # Apply GNOME settings (Fedora)
```

> **Platform-specific guides:** [macOS](macos/README.md) | [Fedora](linux/fedora/README.md)

## Post-Installation

1. **Create local git config:**
   ```bash
   cp ~/dotfiles/git/.gitconfig.local.example ~/.gitconfig.local
   # Edit with your name and email
   ```

2. **Setup SSH:**
   ```bash
   cp ~/dotfiles/ssh/config.example ~/.ssh/config
   chmod 600 ~/.ssh/config
   # Edit with your hosts
   ```

3. **Restart terminal** or run:
   ```bash
   source ~/.zshrc
   ```

## Customization

Create local override files (not committed to git):

- `shell/zsh/local.zsh` - Machine-specific shell config
- `~/.gitconfig.local` - Private git settings
- `~/.ssh/config` - SSH hosts

## Updating

```bash
dotfiles update     # Pull latest and reinstall
# or
cd ~/dotfiles && git pull && make core
```

## Management

```bash
dotfiles update     # Update dotfiles
dotfiles edit       # Open in editor
dotfiles backup     # Backup current configs
dotfiles restore    # List backups
dotfiles status     # Git status
```

## License

MIT
