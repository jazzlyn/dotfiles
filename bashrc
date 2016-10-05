#
# ~/.bashrc
#
# bash color variables ######################
# \[\e[COLORCODEm\]' scheme
export COLOR_RED='\[\e[0;31;40m\]'
export COLOR_RED_BOLD='\[\e[1;31;40m\]'
export COLOR_GREEN='\[\e[0;32;40m\]'
export COLOR_GREEN_BOLD='\[\e[1;30;40m\]'
export COLOR_BROWN='\[\e[0;33;40m\]'
export COLOR_BROWN_BOLD='\[\e[1;33;40m\]'
export COLOR_BLUE='\[\e[0;34;40m\]'
export COLOR_BLUE_BOLD='\[\e[1;34;40m\]'
export COLOR_PURPLE='\[\e[0;35;40m\]'
export COLOR_PURPLE_BOLD='\[\e[1;35;40m\]'
export COLOR_CYAN='\[\e[0;36;40m\]'
export COLOR_CYAN_BOLD='\[\e[1;36;40m\]'
export COLOR_WHITE='\[\e[0;37;40m\]'
export COLOR_WHITE_BOLD='\[\e[1;37;40m\]'

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
alias vim='nvim'
alias serve='python -m http.server'
alias tmux='tmux -2'

#
# colorizing the prompt #################
#
# get user
thisUser=$(id -un)
root=root
# get hostname
thisHost=$(hostname)
# set compared hostnames
purple=purple
white=white
blue=blue
# default
#PS1='[\u@\h \W]\$ '


if [[ $thisUser == $root ]]; then
    PS1=$COLOR_RED'\u'$COLOR_WHITE'@'$COLOR_RED_BOLD'\h'$COLOR_WHITE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ ' 

elif [[ $thisUser != $root ]] && [[ $thisHost = $purple ]]; then
    PS1=$COLOR_PURPLE'\u'$COLOR_WHITE'@'$COLOR_PURPLE_BOLD'\h'$COLOR_WHITE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ '

elif [[ $thisUser != $root ]] && [[ $thisHost = $white ]]; then
    PS1=$COLOR_WHITE'\u'$COLOR_BLUE'@'$COLOR_WHITE_BOLD'\h'$COLOR_BLUE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ '

elif [[ $thisUser != $root ]] && [[ $thisHost = $blue ]]; then
    PS1=$COLOR_BLUE'\u'$COLOR_BLUE_BOLD'@'$COLOR_BLUE'\h'$COLOR_WHITE': '$COLOR_CYAN'\W '$COLOR_WHITE'\$ '

fi

#
# set vim as default editor
#
export VISUAL=nvim
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

# The next block was inserted by the `cli' module of
# The SCORE Framework (http://score-framework.org)

  # The following line makes sure that you can access the `score'
  # application in your shell:
  case "$PATH" in
    */home/***REMOVED***/.local/bin*)
      true
      ;;
    *)
      PATH=/home/***REMOVED***/.local/bin:$PATH
      ;;
  esac

# The next block was inserted by the `projects' module of
# The SCORE Framework (http://score-framework.org)

  # This next line updates your shell prompt to include the name of
  # the current project.
  if [ -n "$VIRTUAL_ENV_NAME" ]; then
      export PS1="\[[0;33m\](${VIRTUAL_ENV_NAME})\[[0m\]$PS1"
  elif [ -n "$VIRTUAL_ENV" ]; then
      export PS1="\[[0;33m\](${VIRTUAL_ENV##*/})\[[0m\]$PS1"
  fi
