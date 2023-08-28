if command -v flux > /dev/null 2>&1; then
  source <(flux completion zsh)
fi

if command -v helm > /dev/null 2>&1; then
  source <(helm completion zsh)
fi

if command -v kubectl > /dev/null 2>&1; then
  source <(kubectl completion zsh)
  export KUBE_CONFIG_PATH=$HOME/.kube/config
fi

if command -v talosctl > /dev/null 2>&1; then
  source <(talosctl completion zsh)
fi
