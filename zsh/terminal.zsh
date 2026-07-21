alias cd..="cd .."
alias ll="ls -lh --color=auto"
alias la="ls -lah --color=auto"
alias grep="grep --color=auto"

# set compatible TERM before ssh
alias ssh="TERM=xterm-256color ssh"

alias ollama="docker exec -it ollama ollama"

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

oc() {
  local path="${1:-.}"
  # resolve relative paths to absolute using current directory
  if [[ "$path" == . ]]; then
    path="$(pwd)"
  fi
  # handle quoted tilde: oc '~/projects/foo'
  if [[ "$path" == \~* ]]; then
    path="/home/opencode${path:1}"
  # handle unquoted tilde (already expanded by outer shell to $HOME)
  elif [[ "$path" == "$HOME"* ]]; then
    path="/home/opencode${path#$HOME}"
  fi
  /usr/bin/sudo -u opencode bash -i -c "cd '$path' && exec opencode"
}
