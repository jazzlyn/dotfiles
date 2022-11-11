export BOTO_PATH="$HOME/.secrets/gcloud/boto"

[[ -f /usr/bin/gcloud ]] && source /opt/google-cloud-sdk/completion.zsh.inc
[[ -f /usr/bin/gcloud ]] && source /opt/google-cloud-sdk/path.zsh.inc
[[ -f /usr/bin/gcloud ]] && export USE_GKE_GCLOUD_AUTH_PLUGIN="True"
