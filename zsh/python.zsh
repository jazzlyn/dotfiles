# # enable pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# # enable pyenvvirtualenv
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# eval "$(pyenv virtualenv-init -)"

python_venv() {
  [[ -d ".venv" ]] && source .venv/bin/activate > /dev/null 2>&1
  [[ ! -d ".venv" ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

python_venv
