export BOTO_PATH="$HOME/.config/gcloud/boto"
export CLOUDSDK_PYTHON="/usr/bin/python3"
export USE_GKE_GCLOUD_AUTH_PLUGIN="True"

if [[ -v $IN_NIX_SHELL && -f $(ls $NIX_STORE/*google-cloud*/google-cloud*/path.zsh.inc) ]]; then
  source $(ls $NIX_STORE/*google-cloud*/google-cloud*/path.zsh.inc)
elif [[ -f /opt/google-cloud-cli/path.zsh.inc ]]; then
  source /opt/google-cloud-cli/path.zsh.inc
else
  echo "google-cloud zsh path config not found"
fi

if [[ -f /opt/google-cloud-cli/completion.zsh.inc ]]; then
  source /opt/google-cloud-cli/completion.zsh.inc
elif [[ -f /usr/share/google-cloud-sdk/completion.zsh.inc ]]; then
  source /usr/share/google-cloud-sdk/completion.zsh.inc
else
  echo "google-cloud zsh completion not found"
fi
