# History options
setopt hist_verify
setopt share_history
setopt hist_ignore_space
setopt histignorealldups

HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=99999

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# enable reverse search
# https://unix.stackexchange.com/a/30169
bindkey -v
bindkey "^R" history-incremental-pattern-search-backward
