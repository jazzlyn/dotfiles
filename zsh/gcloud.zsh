export BOTO_PATH="$HOME/.secrets/gcloud/boto"

[[ -f /usr/bin/gcloud ]] && source /opt/google-cloud-cli/completion.zsh.inc
[[ -f /usr/bin/gcloud ]] && source /opt/google-cloud-cli/path.zsh.inc
[[ -f /usr/bin/gcloud ]] && export USE_GKE_GCLOUD_AUTH_PLUGIN="True"
