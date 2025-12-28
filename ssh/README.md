# SSH Configuration

## Key Generation

Generate a new SSH key using Ed25519 (recommended):

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

For legacy systems that don't support Ed25519:

```bash
ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
```

## Setup

1. Copy the example config:
   ```bash
   cp ~/dotfiles/ssh/config.example ~/.ssh/config
   chmod 600 ~/.ssh/config
   ```

2. Edit the config with your hosts:
   ```bash
   code ~/.ssh/config
   ```

3. Add your public key to GitHub/GitLab:
   ```bash
   cat ~/.ssh/id_ed25519.pub | pbcopy  # macOS
   cat ~/.ssh/id_ed25519.pub | xclip   # Linux
   ```

## Multiple GitHub Accounts

If you have personal and work GitHub accounts:

```
# Personal
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

# Work
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work
```

Clone work repos with:
```bash
git clone git@github-work:organization/repo.git
```

## SSH Agent (macOS)

macOS automatically manages ssh-agent. Keys are added on first use.

To manually add a key:
```bash
ssh-add ~/.ssh/id_ed25519
```

## Testing Connection

```bash
ssh -T git@github.com
# Hi username! You've successfully authenticated...
```
