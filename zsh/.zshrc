# startX
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

setopt pushd_to_home
setopt HIST_IGNORE_SPACE

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# load machine-specific configuration if present
[[ -f $HOME/.zsh_profile ]] && source $HOME/.zsh_profile

# load zsh support for nix-shell
[[ -f /usr/share/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh ]] && source /usr/share/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh

source $ZDOTDIR/history.zsh
source $ZDOTDIR/terminal.zsh
source $ZDOTDIR/exports.zsh
source $ZDOTDIR/keybindings.zsh
source $ZDOTDIR/completions.zsh
source $ZDOTDIR/editor.zsh

# if command -v az > /dev/null 2>&1; then
#   source $ZDOTDIR/azure.zsh
# fi

if command -v direnv > /dev/null 2>&1; then
  source $ZDOTDIR/direnv.zsh
fi

if command -v gcloud > /dev/null 2>&1; then
  source $ZDOTDIR/gcloud.zsh
fi

if command -v go > /dev/null 2>&1; then
  source $ZDOTDIR/go.zsh
fi

source $ZDOTDIR/kubernetes.zsh

if command -v mise > /dev/null 2>&1; then
  source $ZDOTDIR/mise.zsh
fi

if command -v nix > /dev/null 2>&1; then
  source $ZDOTDIR/nix.zsh
fi

if command -v npm > /dev/null 2>&1; then
  source $ZDOTDIR/npm.zsh
fi

if command -v pacman > /dev/null 2>&1; then
  source $ZDOTDIR/pacman.zsh
fi

if command -v pyenv > /dev/null 2>&1; then
  source $ZDOTDIR/python.zsh
fi

if [[ -v $IN_NIX_SHELL && -f $(ls $NIX_STORE/*spaceship-prompt*/lib/spaceship-prompt/spaceship.zsh) ]]; then
  source $(/bin/ls $NIX_STORE/*spaceship-prompt*/lib/spaceship-prompt/spaceship.zsh)
  source $ZDOTDIR/prompt.zsh
elif [[ -f /usr/lib/spaceship-prompt/spaceship.zsh ]]; then
  source /usr/lib/spaceship-prompt/spaceship.zsh
  source $ZDOTDIR/prompt.zsh
elif [[ -f $HOME/.zsh/spaceship-prompt/spaceship.zsh ]]; then
  source $HOME/.zsh/spaceship-prompt/spaceship.zsh
  source $ZDOTDIR/prompt.zsh
else
  echo "spaceship-prompt not found"
fi

[[ -d $HOME/.secrets/vault ]] && source $ZDOTDIR/vault.zsh
