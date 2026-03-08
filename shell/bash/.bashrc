# ~/.bashrc - Bash Configuration
# ================================

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# ===================================
# Environment
# ===================================
export DOTFILES="${HOME}/dotfiles"

# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

# Editor
export EDITOR="code"
export VISUAL="code"

# Language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# ===================================
# Shared configuration
# ===================================
source "${DOTFILES}/shell/shared/exports.zsh"
source "${DOTFILES}/shell/shared/aliases.sh"
source "${DOTFILES}/shell/shared/functions.sh"

# ===================================
# Oh-My-Posh Prompt
# ===================================
if command -v oh-my-posh &>/dev/null; then
    eval "$(oh-my-posh init bash --config ${DOTFILES}/shell/zsh/ohmyposh.json)"
fi

# ===================================
# Zoxide (must be last)
# ===================================
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash --cmd cd)"
fi

# ===================================
# Local overrides (not in git)
# ===================================
[[ -f "${DOTFILES}/shell/bash/local.bash" ]] && source "${DOTFILES}/shell/bash/local.bash"
