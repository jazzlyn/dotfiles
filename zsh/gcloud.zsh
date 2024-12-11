export BOTO_PATH="$HOME/.secrets/gcloud/boto"
export CLOUDSDK_PYTHON="/usr/bin/python3"
export USE_GKE_GCLOUD_AUTH_PLUGIN="True"

if [[ -v $IN_NIX_SHELL && -f $(ls $NIX_STORE/*google-cloud*/google-cloud*/path.zsh.inc) ]]; then
  source $(ls $NIX_STORE/*google-cloud*/google-cloud*/path.zsh.inc)
elif [[ -f $(ls /opt/google-cloud-*/path.zsh.inc) ]]; then
  source $(ls /opt/google-cloud-*/path.zsh.inc)
else
  echo "google-cloud zsh path config not found"
fi

if [[ -f $(ls /opt/google-cloud-*/completion.zsh.inc) ]]; then
  source $(ls /opt/google-cloud-*/completion.zsh.inc)
fi
