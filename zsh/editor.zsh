if command -v nvim > /dev/null 2>&1; then
    export VISUAL="nvim"
    alias vim="nvim"
else
    export VISUAL="vim"
fi
export EDITOR=$VISUAL