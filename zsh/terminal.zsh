alias cd..="cd .."
alias ll="ls -lh --color=auto"
alias la="ls -lah --color=auto"
alias grep="grep --color=auto"

# set compatible TERM before ssh
alias ssh="TERM=xterm-256color ssh"

alias ollama="docker exec -it ollama ollama"

git() {
  local g="$(command -v git)"
  if [[ $@ == "broom" ]]; then
    command "$g" fetch --prune # fetch and prune stale remote refs
    command "$g" switch main
    command "$g" pull --ff-only # fast forward only
    if command "$g" rev-parse --verify develop >/dev/null 2>&1; then
      command "$g" switch develop
      command "$g" pull --ff-only # fast forward only
    fi
    # classify and delete safe branches
    for branch in $(command "$g" branch --format='%(refname:short)' | grep -vE '^(main|master|develop)$'); do
      if command "$g" branch --merged | grep -q "$branch"; then # must be merged into protected branch
        if ! command "$g" ls-remote --heads origin "$branch" | grep -q "$branch"; then
          echo "Deleting $branch (merged, remote gone)"
          command "$g" branch -d "$branch"
        else
          echo "Skipping $branch (remote still exists)"
        fi
      else
        echo "Skipping $branch (not merged)"
      fi
    done
  else
    command "$g" "$@"
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
