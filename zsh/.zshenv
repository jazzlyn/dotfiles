ZDOTDIR="${${(%):-%x}:P:h}"
export PATH=/usr/local/bin:$HOME/.local/bin:$PATH

if [[ -z $SSH_AUTH_SOCK && -S $XDG_RUNTIME_DIR/ssh-tpm-agent.sock ]]; then
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-tpm-agent.sock
fi

if command -v mise > /dev/null 2>&1; then
  source $ZDOTDIR/mise.zsh
fi

if command -v direnv > /dev/null 2>&1; then
  source $ZDOTDIR/direnv.zsh
fi
