# Zsh Options
# ===========

# Changing Directories
setopt autocd              # If only directory path is entered, cd there
setopt auto_pushd          # Push directories to stack
setopt pushd_ignore_dups   # Don't push duplicates
setopt pushd_silent        # Don't print directory stack

# Completion
setopt complete_in_word    # Complete from both ends of a word
setopt always_to_end       # Move cursor to end after completion

# Expansion and Globbing
setopt extendedglob        # Extended globbing (regex with *)
setopt nocaseglob          # Case insensitive globbing
setopt numericglobsort     # Sort filenames numerically when it makes sense
setopt rcexpandparam       # Array expansion with parameters

# Input/Output
setopt correct             # Auto correct mistakes
setopt nobeep              # No beep on error
setopt interactive_comments # Allow comments in interactive mode

# Job Control
setopt nocheckjobs         # Don't warn about running processes when exiting
setopt longlistjobs        # Display PID when suspending processes

# Prompting
setopt prompt_subst        # Enable prompt substitution

# Scripts and Functions
setopt multios             # Perform multiple redirections
