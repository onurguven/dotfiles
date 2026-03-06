# Shared Aliases
# ==============
# Works in both zsh and bash

# ===================================
# Shell Management
# ===================================
alias reload="exec $SHELL -l"
alias zshrc="source ~/.zshrc"
alias zshconfig="${EDITOR:-code} ~/dotfiles/shell/zsh/.zshrc"

# ===================================
# Modern CLI Replacements
# ===================================

# eza (ls replacement)
if command -v eza &>/dev/null; then
    alias ls='eza --icons --group-directories-first'
    alias l='eza -l --icons --group-directories-first'
    alias la='eza -la --icons --group-directories-first'
    alias ll='eza -l --icons --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
    alias lta='eza --tree --level=2 --icons -a'
else
    # Fallback to regular ls
    alias ls='ls --color=auto'
    alias l='ls -l'
    alias la='ls -la'
    alias ll='ls -l'
fi

# bat (cat replacement)
if command -v bat &>/dev/null; then
    alias cat='bat --paging=never'
    alias catp='bat'  # with paging
fi

# zoxide (cd replacement)
if command -v zoxide &>/dev/null; then
    alias cd='z'
fi

# ===================================
# Navigation
# ===================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# Quick directories
alias dev="cd ~/dev"
alias repos="cd ~/dev/repos"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# ===================================
# File Operations
# ===================================
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'

# ===================================
# Search & Find
# ===================================
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ===================================
# Network
# ===================================
alias hosts="sudo ${EDITOR:-code} /etc/hosts"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias ping='ping -c 5'

# ===================================
# Git
# ===================================
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline -20'
alias glog='git log --graph --oneline --decorate'
alias gst='git stash'
alias gstp='git stash pop'
alias lg='lazygit'

# ===================================
# Docker
# ===================================
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dup='docker compose up -d'
alias ddown='docker compose down'
alias dstop='docker compose stop'
alias dlogs='docker compose logs -f'
alias dexec='docker exec -it'

# ===================================
# Editor
# ===================================
alias c='code'
alias c.='code .'

# ===================================
# System Info
# ===================================
alias paths='echo -e ${PATH//:/\\n}'
alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"

# ===================================
# Misc
# ===================================
alias week='date +%V'
alias timestamp='date +%s'
alias cls='clear'
alias h='history'
alias hclear='echo > ${HISTFILE:-~/.zsh_history} && history -p && echo "History cleared"'
alias j='jobs -l'

# ===================================
# Platform-specific
# ===================================
if [[ "$OSTYPE" == darwin* ]]; then
    alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
    alias emptytrash='rm -rf ~/.Trash/*'
    alias afk='pmset displaysleepnow'
else
    alias flushdns='sudo systemd-resolve --flush-caches'
    alias emptytrash='rm -rf ~/.local/share/Trash/files/*'
    alias afk='dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock'
fi
