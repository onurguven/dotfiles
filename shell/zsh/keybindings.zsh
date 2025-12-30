# Zsh Key Bindings
bindkey -e  # Emacs mode

# Home/End keys (multiple terminal variants)
bindkey '^[[H' beginning-of-line   # Home (xterm)
bindkey '^[[F' end-of-line         # End (xterm)
bindkey '^[[1~' beginning-of-line  # Home (linux console, tmux)
bindkey '^[[4~' end-of-line        # End (linux console, tmux)

# Delete key
bindkey '^[[3~' delete-char  # Delete

# Word navigation (Ctrl+Arrow on Linux)
bindkey '^[[1;5D' backward-word    # Ctrl+Left
bindkey '^[[1;5C' forward-word     # Ctrl+Right

# History (zsh-history-substring-search)
bindkey '^[[A' history-substring-search-up    # Up Arrow
bindkey '^[[B' history-substring-search-down  # Down Arrow

# Undo
bindkey '^[[Z' undo # Shift+Tab

# Autosuggestions
bindkey '^Y' autosuggest-accept # Ctrl+Y

# =============================================================================
# PLATFORM NOTES
# =============================================================================
# macOS (iTerm2):
#   - Option+Arrow: Word navigation (sends Esc+b/f, works with emacs mode)
#   - Cmd+Left/Right: Line start/end (sends Ctrl+A/E)
#   - Option+Backspace: Delete word (sends Esc+Backspace)
#   - Cmd+Backspace: Delete line (sends Ctrl+U)
#
# Linux (GNOME Terminal/Tilix/VSCode):
#   - Ctrl+Arrow: Word navigation (bound above)
#   - Ctrl+A/E: Line start/end
#   - Home/End: Line start/end
#   - Alt+Backspace: Delete word
#   - Ctrl+U: Delete line
#
# Both platforms:
#   - Ctrl+L: Clear screen
