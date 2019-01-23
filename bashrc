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

alias hdmiOn='xrandr --output eDP-1 --auto --output HDMI-1 --auto --above eDP-1'
alias hdmiMirror='xrandr --fb 1920x1080 --output eDP-1 --mode 1440x900 --scale 1x1 --output HDMI-1 --mode 1920x1080 --scale-from 1440x900 --same-as eDP-1'
alias hdmiOff='xrandr --output HDMI-1 --off'
alias vpn='sudo openvpn --config /etc/openvpn/vpn.conf'

alias pacman-local='sudo pacman -Qm'
alias pacman-autoremove='sudo pacman -R $(pacman -Qdtq)'
alias pacman-clearcache='sudo pacman -Scc'

if command -v python > /dev/null 2>&1; then
    alias serve='python -m http.server'
fi
if command -v tmux > /dev/null 2>&1; then
    alias tmux='tmux -2'
fi

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

thisUser=$(id -un) # get user
thisHost=$(hostname) # get host

# set hosts to be compared, TODO: find smarter way
root=root
purple=PURPLE
white=white

#PS1='[\u@\h \W]\$ ' default scheme

if [[ $thisUser == $root ]]; then
    PS1=$COLOR_RED'\u'$COLOR_WHITE'@'$COLOR_RED_BOLD'\h'$COLOR_WHITE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ ' 

elif [[ $thisUser != $root ]] && [[ $thisHost = $purple ]]; then
    PS1=$COLOR_PURPLE'\u'$COLOR_WHITE'@'$COLOR_PURPLE_BOLD'\h'$COLOR_WHITE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ '

elif [[ $thisUser != $root ]] && [[ $thisHost = $white ]]; then
    PS1=$COLOR_WHITE'\u'$COLOR_BLUE'@'$COLOR_WHITE_BOLD'\h'$COLOR_BLUE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ '

else
    PS1=$COLOR_BLUE'\u'$COLOR_BLUE_BOLD'@'$COLOR_BLUE'\h'$COLOR_WHITE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ '
fi
