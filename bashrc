#
# ~/.bashrc
#

#
# If not running interactively, don't do anything
###
[[ $- != *i* ]] && return

#
# VARIABLES
###

# LS Colorizing

LS_COLORS="di=01;34:fi=00;:ln=00;93:or=00;41:mi=00;41:ex=01;31:*.png=00;37:*.jpg=00;37:*.zip=00;32:*.tar.gz=00;32:*.tar=00;32:*.rar=00;32:*.jar=00;33"
export LS_COLORS
export TERM=xterm-256color
export GREP_COLOR="1;32"

#
# ALIAS Configuration
###

alias cd..="cd .."
alias ls="ls --color"
alias ls="ls -lh --color"
alias la="ls -lah --color"
alias grep="grep --color=always"

alias pacman-local="comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort)"
alias pacman-aur="pacman -Qm"
alias pacman-autoremove="sudo pacman -R $(pacman -Qdtq)"
alias pacman-clearcache="pacman -Scc"

alias terraform-fmt="terraform fmt -recursive -write=true -diff=true"

# LIBVIRT
export LIBVIRT_DEFAULT_URI="qemu:///system"

# VIM/NVIM as default editor

if command -v nvim > /dev/null 2>&1; then
    export VISUAL="nvim"
    alias vim="nvim"
else
    export VISUAL="vim"
fi
export EDITOR=$VISUAL

# NPM
export NPM_PACKAGES="${HOME}/.npm_packages"
export NODE_PATH="${NPM_PACKAGES}/libs/node_modules:$NODE_PATH"

# Google Cloud completion
[[ -f /usr/bin/gcloud ]] && source /opt/google-cloud-sdk/completion.bash.inc
[[ -f /usr/bin/gcloud ]] && source /opt/google-cloud-sdk/path.bash.inc

#
# PROMPT Colorizing
###

RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
BLUE="\[\e[1;34m\]"
PURPLE="\[\e[1;35m\]"
CYAN="\[\e[1;36m\]"
ORANGE="\[\e[38;5;208m\]"
ENDCOLOR="\[\e[0m\]"

#PS1="[\u@\h \W]\$ "

if [ $HOSTNAME == purple ]; then # magenta
    PS1="${PURPLE}\u${ENDCOLOR}@${PURPLE}\h${ENDCOLOR} ${BLUE}\W${ENDCOLOR} \$ "
elif [ $HOSTNAME ==  carbon ]; then # orange
    PS1="${ORANGE}\u${ENDCOLOR}@${ORANGE}\h${ENDCOLOR} ${BLUE}\W${ENDCOLOR} \$ "
else
    PS1="\u@\e[1m\h\e[0m \W \$ "
fi

source $HOME/.profile
source $HOME/.nvm/nvm.sh