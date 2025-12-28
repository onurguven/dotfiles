# ~/.zshenv - Environment variables (loaded first, for all shells)
# This file is sourced by all zsh shells (interactive and non-interactive)

# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

# Dotfiles location
export DOTFILES="${HOME}/dotfiles"
export ZSH_DIR="${DOTFILES}/shell/zsh"

# Editor
export EDITOR="code"
export VISUAL="code"

# Language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
