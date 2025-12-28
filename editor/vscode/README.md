# VS Code Configuration

## Strategy: Settings Sync + Dotfiles Backup

### Primary: Settings Sync

VS Code's built-in Settings Sync handles:
- User settings
- Keybindings
- Extensions
- Snippets
- UI State

**Enable:**
1. Open VS Code
2. Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Linux)
3. Search "Settings Sync: Turn On"
4. Sign in with GitHub

### Secondary: Dotfiles Backup

This repo contains backup/reference files:

- `extensions.txt` - List of installed extensions
- `settings.json` - Base settings (minimal)

## Extension Management

### Export current extensions

```bash
code --list-extensions > ~/dotfiles/editor/vscode/extensions.txt
```

### Install from list

```bash
cat ~/dotfiles/editor/vscode/extensions.txt | xargs -L 1 code --install-extension
```

## Installed Extensions

### Themes & Icons
- chadalen.vscode-jetbrains-icon-theme
- github.github-vscode-theme
- miguelsolorio.symbols

### Git
- codezombiech.gitignore
- github.vscode-github-actions

### Languages
- dbaeumer.vscode-eslint
- esbenp.prettier-vscode
- bradlc.vscode-tailwindcss
- vue.volar
- ms-python.python
- jakebecker.elixir-ls
- laravel.vscode-laravel
- prisma.prisma

### Utilities
- aaron-bond.better-comments
- editorconfig.editorconfig
- mikestead.dotenv

### AI
- anthropic.claude-code

## Settings Notes

The `settings.json` in this repo is minimal and contains only:
- Font settings (JetBrains Mono Nerd Font)
- Basic editor preferences
- Terminal settings

Most settings should be managed via Settings Sync for better compatibility across machines.
