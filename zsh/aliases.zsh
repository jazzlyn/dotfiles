# ALIAS Configuration

alias cd..="cd .."
alias ls="ls --color"
alias ls="ls -lh --color"
alias la="ls -lah --color"
alias grep="grep --color=always"
alias diff="colordiff"

alias pacman-local="comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort)"
alias pacman-aur="pacman -Qm"
alias pacman-autoremove="sudo pacman -R $(pacman -Qdtq)"
alias pacman-clearcache="pacman -Scc"

alias terraform-fmt="terraform fmt -recursive -write=true -diff=true"

# set compatible TERM before ssh
alias ssh='TERM=xterm-256color ssh'