alias cd..="cd .."
alias ll="ls -lh --color=auto"
alias la="ls -lah --color=auto"
alias grep="grep --color=auto"

# set compatible TERM before ssh
alias ssh="TERM=xterm-256color ssh"

git() {
    if [[ $@ == "broom" ]]; then
        command "$(command -v git)" switch main
        command "$(command -v git)" pull
        if command "$(command -v git)" rev-parse --verify develop >/dev/null 2>&1; then
            command "$(command -v git)" switch develop
            command "$(command -v git)" pull
        fi
        # delete merged branches except main, master, and develop
        command "$(command -v git)" branch --merged | grep -E -v "(^\*|master|main|develop)" | xargs -r "$(command -v git)" branch -d
    else
        command "$(command -v git)" "$@"
    fi
}
