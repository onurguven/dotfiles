# Zsh Key Bindings
# =================
#
# This file configures keyboard shortcuts for zsh command line editing.
# We use emacs mode which provides intuitive shortcuts for text navigation.
#
# ARCHITECTURE:
# - Terminal emulator (iTerm2/Tilix) sends escape sequences for special keys
# - Zsh interprets these sequences via bindkey
# - Emacs mode provides default shortcuts for common operations
#
# ESCAPE SEQUENCE FORMAT:
# ^[  = Escape (ESC)
# ^[[ = CSI (Control Sequence Introducer)
# Examples:
#   ^[[A     = Up Arrow
#   ^[[1;2D  = Shift+Left Arrow (modifier 2 = Shift)
#   ^[[1;5C  = Ctrl+Right Arrow (modifier 5 = Ctrl)

# =============================================================================
# EMACS MODE
# =============================================================================
# Enables emacs-style line editing. This is the default for most users.
# Alternative: bindkey -v for vim mode
bindkey -e

# =============================================================================
# EMACS MODE DEFAULT SHORTCUTS (built-in, no config needed)
# =============================================================================
# These work automatically with `bindkey -e`. Listed here for reference.
#
# NAVIGATION:
#   Ctrl+A          Beginning of line
#   Ctrl+E          End of line
#
# DELETION:
#   Ctrl+W          Delete word before cursor
#   Ctrl+K          Kill (cut) from cursor to end of line
#   Ctrl+U          Kill from cursor to beginning of line
#
# MISC:
#   Ctrl+L          Clear screen
# =============================================================================
# TERMINAL-SPECIFIC BINDINGS
# =============================================================================
# These map terminal escape sequences to zsh functions.
# Required because terminals send different codes than emacs expects.

# Home/End keys
# Different terminals send different sequences, so we bind both common variants
bindkey '^[[H' beginning-of-line   # Home (xterm)
bindkey '^[[F' end-of-line         # End (xterm)
bindkey '^[[1~' beginning-of-line  # Home (linux console, tmux)
bindkey '^[[4~' end-of-line        # End (linux console, tmux)

# Delete key
bindkey '^[[3~' delete-char

# =============================================================================
# HISTORY NAVIGATION
# =============================================================================
# Using zsh-history-substring-search plugin for smarter history search.
# Unlike basic history-search, this matches anywhere in the command.
#
# Example: Type "docker" then press Up to find "sudo docker build ..."
bindkey '^[[A' history-substring-search-up    # Up Arrow
bindkey '^[[B' history-substring-search-down  # Down Arrow

# =============================================================================
# UNDO
# =============================================================================
bindkey '^[[Z' undo  # Shift+Tab

# =============================================================================
# PLUGIN INTEGRATION
# =============================================================================
# zsh-autosuggestions: Accept suggestion with Ctrl+Y
# Note: Ctrl+Space conflicts with IBus (Linux input method)
bindkey '^Y' autosuggest-accept

# =============================================================================
# PLATFORM NOTES
# =============================================================================
# macOS (iTerm2):
#   - Option+Arrow: Word navigation (sends Esc+b/f, works with emacs mode)
#   - Cmd+Left/Right: Line start/end (sends Ctrl+A/E)
#   - Cmd+Backspace: Delete line (sends Ctrl+U)
#
# Linux (GNOME Terminal/Tilix):
#   - Alt+Arrow: Word navigation (if terminal configured correctly)
