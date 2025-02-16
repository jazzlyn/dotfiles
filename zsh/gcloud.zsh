export BOTO_PATH="$HOME/.config/gcloud/boto"
export CLOUDSDK_PYTHON="/usr/bin/python3"
export USE_GKE_GCLOUD_AUTH_PLUGIN="True"

if [[ $MISE_SHELL && -f $HOME/.local/share/mise/installs/gcloud/latest/path.zsh.inc ]]; then
  source $HOME/.local/share/mise/installs/gcloud/latest/path.zsh.inc
elif [[ -f /opt/google-cloud-cli/path.zsh.inc ]]; then
  source /opt/google-cloud-cli/path.zsh.inc
elif [[ -f /usr/share/google-cloud-sdk/path.zsh.inc ]]; then
  source /usr/share/google-cloud-sdk/path.zsh.inc
else
  echo "google-cloud zsh path not found"
fi

if [[ $MISE_SHELL && -f $HOME/.local/share/mise/installs/gcloud/latest/completion.zsh.inc ]]; then
  source $HOME/.local/share/mise/installs/gcloud/latest/completion.zsh.inc
elif [[ -f /opt/google-cloud-cli/completion.zsh.inc ]]; then
  source /opt/google-cloud-cli/completion.zsh.inc
elif [[ -f /usr/share/google-cloud-sdk/completion.zsh.inc ]]; then
  source /usr/share/google-cloud-sdk/completion.zsh.inc
else
  echo "google-cloud zsh completion not found"
fi
