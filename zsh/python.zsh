# if .venv is present in project then load env automatically
python_venv() {
  # check for .venv directory
  if [[ -d ".venv" ]]; then
    echo "virtualenv: loading"
    source .venv/bin/activate > /dev/null 2>&1
    return
  fi

  # deactivate if no env found and one is active
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "virtualenv: unloading"
    deactivate > /dev/null 2>&1
  fi
}

add-zsh-hook chpwd python_venv
python_venv
