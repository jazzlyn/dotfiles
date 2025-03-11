# # enable pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# # enable pyenvvirtualenv
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# eval "$(pyenv virtualenv-init -)"

python_venv() {
  # check for .venv directory
  if [[ -d ".venv" ]]; then
    echo "virtualenv: loading"
    source .venv/bin/activate > /dev/null 2>&1
    return
  fi

  # check for poetry env
  if [[ -f "pyproject.toml" ]] && command -v poetry &> /dev/null; then
    poetry_env=$(poetry env info -p 2>/dev/null)
    if [[ $? -eq 0 && -n "$poetry_env" ]]; then
      echo "virtualenv: loading $poetry_env"
      source "$poetry_env/bin/activate" > /dev/null 2>&1
      return
    fi
  fi

  # deactivate if no env found and one is active
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "virtualenv: unloading"
    deactivate > /dev/null 2>&1
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

python_venv
