# ~/.zshrc - Zsh Configuration
# =============================
# Modular zsh configuration with Zimfw
# Environment variables are set in .zshenv

# ===================================
# Zimfw Plugin Manager
# ===================================
ZIM_HOME="${HOME}/.zim"

# Download zimfw if missing
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules and update init.zsh if outdated
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize Zimfw modules
source ${ZIM_HOME}/init.zsh

# ===================================
# Load modular configuration
# ===================================

# Core settings
source "${ZSH_DIR}/options.zsh"
source "${ZSH_DIR}/history.zsh"
source "${ZSH_DIR}/completion.zsh"
source "${ZSH_DIR}/keybindings.zsh"

# ===================================
# Shared configuration
# ===================================
source "${DOTFILES}/shell/shared/exports.zsh"
source "${DOTFILES}/shell/shared/aliases.sh"
source "${DOTFILES}/shell/shared/functions.sh"

# ===================================
# Zoxide (smart cd)
# ===================================
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# ===================================
# Oh-My-Posh Prompt (must be last)
# ===================================
if command -v oh-my-posh &>/dev/null; then
    eval "$(oh-my-posh init zsh --config ${ZSH_DIR}/ohmyposh.json)"
fi

# ===================================
# Local overrides (not in git)
# ===================================
[[ -f "${ZSH_DIR}/local.zsh" ]] && source "${ZSH_DIR}/local.zsh" || true
