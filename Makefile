# Dotfiles Makefile
# ==================
# Usage: make [target]

.PHONY: all help install macos fedora core shell git tools terminal editor backup clean zimfw gnome flatpaks dnf gnome-extensions homebrew defaults

# Variables
DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)
BACKUP_DIR := $(HOME)/.dotfiles-backup/$(shell date +%Y%m%d-%H%M%S)
XDG_CONFIG_HOME := $(HOME)/.config

# Colors
GREEN := \033[0;32m
YELLOW := \033[1;33m
RED := \033[0;31m
NC := \033[0m

# Default target
all: help

# Help
help:
	@printf "$(GREEN)Dotfiles Installation$(NC)\n"
	@printf "\n"
	@printf "Usage: make [target]\n"
	@printf "\n"
	@printf "$(YELLOW)Main targets:$(NC)\n"
	@printf "  macos     - Full macOS installation\n"
	@printf "  fedora    - Full Fedora installation\n"
	@printf "  core      - Core configs only (shell + git)\n"
	@printf "\n"
	@printf "$(YELLOW)Individual targets:$(NC)\n"
	@printf "  shell     - Shell configuration (zsh)\n"
	@printf "  git       - Git configuration\n"
	@printf "  tools     - CLI tools configuration\n"
	@printf "  terminal  - Terminal configuration\n"
	@printf "  editor    - Editor configuration (VSCode)\n"
	@printf "\n"
	@printf "$(YELLOW)Utilities:$(NC)\n"
	@printf "  backup    - Backup existing dotfiles\n"
	@printf "  clean     - Remove all symlinks\n"
	@printf "  zimfw     - Install/update Zimfw plugin manager\n"
	@printf "\n"
	@printf "$(YELLOW)macOS specific:$(NC)\n"
	@printf "  homebrew  - Install Homebrew and packages\n"
	@printf "  defaults  - Apply macOS system preferences\n"
	@printf "\n"
	@printf "$(YELLOW)Fedora specific:$(NC)\n"
	@printf "  dnf             - Install DNF packages\n"
	@printf "  flatpaks        - Install Flatpak applications\n"
	@printf "  gnome           - Apply GNOME desktop preferences\n"
	@printf "  gnome-extensions - Install GNOME extensions\n"

# ===================================
# Main Installation Targets
# ===================================

macos: backup zimfw homebrew shell git tools terminal editor defaults
	@printf "$(GREEN)macOS installation complete!$(NC)\n"

fedora: backup zimfw dnf flatpaks shell git tools gnome gnome-extensions
	@printf "$(GREEN)Fedora installation complete!$(NC)\n"

core: backup zimfw shell git
	@printf "$(GREEN)Core installation complete!$(NC)\n"

# ===================================
# Zimfw Plugin Manager
# ===================================

zimfw:
	@printf "$(YELLOW)Installing Zimfw...$(NC)\n"
	@if [ ! -d "$(HOME_DIR)/.zim" ]; then \
		curl -fsSL --create-dirs -o $(HOME_DIR)/.zim/zimfw.zsh \
			https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh; \
	fi
	@ln -sfn $(DOTFILES_DIR)/shell/zsh/.zimrc $(HOME_DIR)/.zimrc
	@printf "$(GREEN)Zimfw installed! Run 'zimfw install' to install plugins.$(NC)\n"

# ===================================
# Backup
# ===================================

backup:
	@printf "$(YELLOW)Creating backup at $(BACKUP_DIR)...$(NC)\n"
	@mkdir -p $(BACKUP_DIR)
	@for file in .zshrc .zshenv .gitconfig .gitignore_global; do \
		[ -f $(HOME_DIR)/$$file ] && cp $(HOME_DIR)/$$file $(BACKUP_DIR)/ 2>/dev/null || true; \
	done
	@[ -d $(HOME_DIR)/.ssh ] && cp -r $(HOME_DIR)/.ssh $(BACKUP_DIR)/ 2>/dev/null || true
	@printf "$(GREEN)Backup created!$(NC)\n"

# ===================================
# Shell Configuration
# ===================================

shell:
	@printf "$(YELLOW)Installing shell configuration...$(NC)\n"
	@ln -sfn $(DOTFILES_DIR)/shell/zsh/.zshrc $(HOME_DIR)/.zshrc
	@ln -sfn $(DOTFILES_DIR)/shell/zsh/.zshenv $(HOME_DIR)/.zshenv
	@printf "$(GREEN)Shell configuration installed!$(NC)\n"

# ===================================
# Git Configuration
# ===================================

git:
	@printf "$(YELLOW)Installing git configuration...$(NC)\n"
	@ln -sfn $(DOTFILES_DIR)/git/.gitconfig $(HOME_DIR)/.gitconfig
	@ln -sfn $(DOTFILES_DIR)/git/.gitignore_global $(HOME_DIR)/.gitignore_global
	@printf "\n"
	@printf "$(YELLOW)Don't forget to create ~/.gitconfig.local with your user info!$(NC)\n"
	@printf "$(YELLOW)See: $(DOTFILES_DIR)/git/.gitconfig.local.example$(NC)\n"
	@printf "$(GREEN)Git configuration installed!$(NC)\n"

# ===================================
# CLI Tools Configuration
# ===================================

tools:
	@printf "$(YELLOW)Installing CLI tools configuration...$(NC)\n"
	@mkdir -p $(XDG_CONFIG_HOME)/bat
	@ln -sfn $(DOTFILES_DIR)/tools/bat/config $(XDG_CONFIG_HOME)/bat/config
	@printf "$(GREEN)Tools configuration installed!$(NC)\n"

# ===================================
# Terminal Configuration
# ===================================

terminal:
	@printf "$(YELLOW)Terminal configuration ready.$(NC)\n"
	@printf "$(YELLOW)For iTerm2: Import profile from $(DOTFILES_DIR)/terminal/iterm2/$(NC)\n"

# ===================================
# Editor Configuration
# ===================================

editor:
	@printf "$(YELLOW)Editor configuration ready.$(NC)\n"
	@printf "$(YELLOW)VSCode settings are managed via Settings Sync.$(NC)\n"
	@printf "$(YELLOW)Extension list: $(DOTFILES_DIR)/editor/vscode/extensions.txt$(NC)\n"

# ===================================
# macOS Specific
# ===================================

homebrew:
	@printf "$(YELLOW)Installing Homebrew...$(NC)\n"
	@command -v brew >/dev/null 2>&1 || \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@printf "$(YELLOW)Installing packages from Brewfile...$(NC)\n"
	@brew bundle --file=$(DOTFILES_DIR)/macos/Brewfile
	@printf "$(GREEN)Homebrew packages installed!$(NC)\n"

defaults:
	@printf "$(YELLOW)Applying macOS defaults...$(NC)\n"
	@bash $(DOTFILES_DIR)/macos/defaults.sh
	@printf "$(GREEN)macOS defaults applied!$(NC)\n"

# ===================================
# Fedora Specific
# ===================================

dnf:
	@bash $(DOTFILES_DIR)/linux/fedora/install-packages.sh

flatpaks:
	@printf "$(YELLOW)Setting up Flatpak...$(NC)\n"
	@flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	@printf "$(YELLOW)Installing Flatpak applications...$(NC)\n"
	@cd $(DOTFILES_DIR)/linux/fedora && \
		flatpak install -y flathub $$(grep -v '^#' flatpaks.txt | grep -v '^$$' | tr '\n' ' ')
	@printf "$(GREEN)Flatpak applications installed!$(NC)\n"

gnome:
	@printf "$(YELLOW)Applying GNOME settings...$(NC)\n"
	@bash $(DOTFILES_DIR)/linux/fedora/gnome.sh
	@printf "$(GREEN)GNOME settings applied!$(NC)\n"

gnome-extensions:
	@printf "$(YELLOW)Installing gnome-extensions-cli...$(NC)\n"
	@command -v pipx >/dev/null 2>&1 || sudo dnf install -y pipx
	@pipx install gnome-extensions-cli 2>/dev/null || pipx upgrade gnome-extensions-cli
	@printf "$(YELLOW)Installing GNOME extensions...$(NC)\n"
	@for ext in $$(grep -v '^#' $(DOTFILES_DIR)/linux/fedora/extensions.txt | grep -v '^$$'); do \
		printf "Installing $$ext...\n"; \
		$(HOME_DIR)/.local/bin/gext install "$$ext" 2>/dev/null || true; \
	done
	@printf "$(GREEN)GNOME extensions installed! Log out and back in to activate.$(NC)\n"

# ===================================
# Cleanup
# ===================================

clean:
	@printf "$(YELLOW)Removing symlinks...$(NC)\n"
	@rm -f $(HOME_DIR)/.zshrc
	@rm -f $(HOME_DIR)/.zshenv
	@rm -f $(HOME_DIR)/.zimrc
	@rm -f $(HOME_DIR)/.gitconfig
	@rm -f $(HOME_DIR)/.gitignore_global
	@rm -f $(XDG_CONFIG_HOME)/bat/config
	@printf "$(GREEN)Symlinks removed!$(NC)\n"
