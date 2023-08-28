export BOTO_PATH="$HOME/.secrets/gcloud/boto"
export USE_GKE_GCLOUD_AUTH_PLUGIN="True"

if [[ -f /opt/google-cloud-*/path.zsh.inc ]]; then
  source $(/bin/ls /opt/google-cloud-*/path.zsh.inc)
elif [[ -f $NIX_STORE/*google-cloud*/google-cloud*/path.zsh.inc ]]; then
  source $(/bin/ls $NIX_STORE/*google-cloud*/google-cloud*/path.zsh.inc)
else
  echo "google-cloud zsh path config not found"
fi
