# Zsh History Configuration
# =========================

HISTFILE="${HOME}/.zhistory"
HISTSIZE=50000
SAVEHIST=50000

# History Options
setopt appendhistory         # Append to history file
setopt histignorealldups     # Remove older duplicate entries
setopt hist_ignore_space     # Ignore commands starting with space
setopt share_history         # Share history between sessions
setopt extended_history      # Save timestamp with history
setopt hist_verify           # Show command before executing from history
setopt hist_reduce_blanks    # Remove superfluous blanks
setopt inc_append_history    # Add commands immediately

# Ignore common commands in history
HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:clear:history"

# Word characters (don't consider these part of word)
WORDCHARS=${WORDCHARS//\/[&.;]}
