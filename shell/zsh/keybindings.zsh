# Zsh Key Bindings
# =================

# Use emacs key bindings
bindkey -e

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# macOS specific
bindkey '^[[1;3D' backward-word  # Alt+Left
bindkey '^[[1;3C' forward-word   # Alt+Right

# Delete word with ctrl+backspace/delete
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# Undo
bindkey '^[[Z' undo              # Shift+Tab

# Home and End keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# Delete key
bindkey '^[[3~' delete-char

# Search history with up/down
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Accept autosuggestion with Ctrl+Space
bindkey '^ ' autosuggest-accept
