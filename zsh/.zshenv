ZDOTDIR="${${(%):-%x}:P:h}"
if [[ -z $SSH_CONNECTION && -z $SSH_TTY && -z $SSH_CLIENT ]]; then
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
fi
