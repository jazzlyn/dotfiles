# zsh: command not found: register-python-argcomplete
if [[ $MISE_SHELL && -f $HOME/.local/share/mise/installs/azure/latest/bin/venv/bin/az.completion.sh ]]; then
  source $HOME/.local/share/mise/installs/azure/latest/bin/venv/bin/az.completion.sh
elif [[ -f /opt/az/bin/az.completion.sh ]]; then
  source /opt/az/bin/az.completion.sh
else
  echo "azure zsh completion not found"
fi
