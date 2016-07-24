#
# ~/.bashrc
#
# bash color variables ######################
export COLOR_NC='\[\e[0m\]' # No Color
export COLOR_BLACK='\[\e[0;30m\]'
export COLOR_WHITE='\[\e[1m\]'
export COLOR_RED='\[\e[0;31m\]'
export COLOR_LIGHT_RED='\[\e[1;31m\]'
export COLOR_GREEN='\[\e[0;32m\]'
export COLOR_LIGHT_GREEN='\[\e[1;32m\]'
export COLOR_BROWN='\[\e[0;33m\]'
export COLOR_YELLOW='\[\e[1;33m\]'
export COLOR_BLUE='\[\e[0;34m\]'
export COLOR_LIGHT_BLUE='\[\e[1;34m\]'
export COLOR_PURPLE='\[\e[0;35m\]'
export COLOR_LIGHT_PURPLE='\[\e[1;35m\]'
export COLOR_CYAN='\[\e[0;36m\]'
export COLOR_LIGHT_CYAN='\[\e[1;36m\]'
export COLOR_DARK_GREY='\[\e[1;37m\]'
export COLOR_LIGHT_GREY='\[\e[0;37m\]'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# configuring and colorizing ls
alias ls='ls --color'
LS_COLORS='di=01;34:fi=00;:ln=00;93:or=00;41:mi=00;41:ex=01;31:*.png=00;37:*.jpg=00;37:*.zip=00;32:*.tar.gz=00;32:*.tar=00;32:*.rar=00;32:*.jar=00;33'
export LS_COLORS

# alias configs
alias cd..='cd ..'
alias ls='ls -lh --color'
alias la='ls -lah --color'

#
# colorizing the prompt #################
#
# default
# PS1='[\u@\h \W]\$ '
# purple
PS1=$COLOR_LIGHT_PURPLE'\u'$COLOR_LIGHT_GREY'@'$COLOR_PURPLE'\h'$COLOR_LIGHT_GREY': '$COLOR_CYAN'\W '$COLOR_LIGHT_GREY'\$ '
# blue
# PS1=$COLOR_LIGHT_BLUE'\u'$COLOR_LIGHT_GREY'@'$COLOR_BLUE'\h'$COLOR_LIGHT_GREY': '$COLOR_CYAN'\W '$COLOR_LIGHT_GREY'\$ '
# red
# PS1=$COLOR_LIGHT_RED'\u'$COLOR_LIGHT_GREY'@'$COLOR_RED'\h'$COLOR_LIGHT_GREY': '$COLOR_CYAN'\W '$COLOR_LIGHT_GREY'\$ '
# green
# PS1=$COLOR_LIGHT_GREEN'\u'$COLOR_LIGHT_GREY'@'$COLOR_GREEN'\h'$COLOR_LIGHT_GREY': '$COLOR_CYAN'\W '$COLOR_LIGHT_GREY'\$ '
# brown
# PS1=$COLOR_YELLOW'\u'$COLOR_LIGHT_GREY'@'$COLOR_BROWN'\h'$COLOR_LIGHT_GREY': '$COLOR_CYAN'\W '$COLOR_LIGHT_GREY'\$ '
#
# set vim as default editor
#
export VISUAL=vim
export EDITOR=$VISUAL

#
# colorizing the bash
#
export TERM=xterm-256color
export GREP_COLOR='1;32'
alias grep='grep --color=always'

#
# custom bins
#
export PATH=$PATH":$HOME/.local/bin"
