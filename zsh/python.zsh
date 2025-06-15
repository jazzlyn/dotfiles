# if .venv is present in project then load env automatically
python_venv() {
  if [ -d ".venv" ] && [ -z "$VIRTUAL_ENV" ]; then
    # echo "virtualenv: loading"
    source .venv/bin/activate > /dev/null 2>&1
  elif [ ! -d ".venv" ] && [ -n "$VIRTUAL_ENV" ]; then
    # echo "virtualenv: unloading"
    deactivate > /dev/null 2>&1
  fi
}

add-zsh-hook chpwd python_venv
python_venv
