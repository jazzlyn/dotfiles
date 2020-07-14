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

# Color Variables
# \[\e[COLORCODEm\]' scheme
# TODO: rewrite this mess

export COLOR_RED_DARK='\[\e[0;40;31m\]'
export COLOR_GREEN_DARK='\[\e[0;40;32m\]'
export COLOR_BROWN_DARK='\[\e[0;40;33m\]'
export COLOR_BLUE_DARK='\[\e[0;40;34m\]'
export COLOR_GREY='\[\e[0;40;39m\]'

export COLOR_GREEN='\[\e[0;40;90m\]'
export COLOR_GREEN_BOLD='\[\e[1;40;90m\]'
export COLOR_RED='\[\e[0;40;91m\]'
export COLOR_RED_BOLD='\[\e[1;40;91m\]'
export COLOR_OLIVE='\[\e[0;40;92m\]'
export COLOR_OLIVE_BOLD='\[\e[1;40;92m\]'
export COLOR_YELLOW='\[\e[0;40;93m\]'
export COLOR_YELLOW_BOLD='\[\e[1;40;93m\]'
export COLOR_BLUE='\[\e[0;40;94m\]'
export COLOR_BLUE_BOLD='\[\e[1;40;94m\]'
export COLOR_PURPLE='\[\e[0;40;95m\]'
export COLOR_PURPLE_BOLD='\[\e[1;40;95m\]'
export COLOR_CYAN='\[\e[0;40;96m\]'
export COLOR_CYAN_BOLD='\[\e[1;40;96m\]'
export COLOR_WHITE='\[\e[0;40;97m\]'
export COLOR_WHITE_BOLD='\[\e[1;40;97m\]'

# LS Colorizing

LS_COLORS='di=01;34:fi=00;:ln=00;93:or=00;41:mi=00;41:ex=01;31:*.png=00;37:*.jpg=00;37:*.zip=00;32:*.tar.gz=00;32:*.tar=00;32:*.rar=00;32:*.jar=00;33'
export LS_COLORS
export TERM=xterm-256color
export GREP_COLOR='1;32'

#
# ALIAS Configuration
###

alias cd..='cd ..'
alias ls='ls --color'
alias ls='ls -lh --color'
alias la='ls -lah --color'
alias grep='grep --color=always'

alias pacman-local='comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort)'
alias pacman-aur='pacman -Qm'
alias pacman-autoremove='sudo pacman -R $(pacman -Qdtq)'
alias pacman-clearcache='pacman -Scc'

# LIBVIRT
export LIBVIRT_DEFAULT_URI="qemu:///system"

# VIM/NVIM as default editor

if command -v nvim > /dev/null 2>&1; then
    export VISUAL='nvim'
    alias vim='nvim'
else
    export VISUAL='vim'
fi
export EDITOR=$VISUAL

#
# PROMPT Colorizing
###

#PS1='[\u@\h \W]\$ ' default scheme

PS1=$COLOR_PURPLE'\u'$COLOR_WHITE'@'$COLOR_PURPLE_BOLD'\h'$COLOR_WHITE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ '

