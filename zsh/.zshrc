if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] && command -v sway >/dev/null 2>&1; then
  export _JAVA_AWT_WM_NONREPARENTING=1
  export SDL_VIDEODRIVER=wayland
  export QT_QPA_PLATFORM=wayland
  export XDG_CURRENT_DESKTOP=sway
  export XDG_SESSION_DESKTOP=sway
  sway --unsupported-gpu
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

if command -v mise > /dev/null 2>&1; then
  source $ZDOTDIR/mise.zsh
fi

autoload -U add-zsh-hook

source $ZDOTDIR/history.zsh
source $ZDOTDIR/terminal.zsh
source $ZDOTDIR/xdg.zsh
source $ZDOTDIR/keybindings.zsh
source $ZDOTDIR/completions.zsh
source $ZDOTDIR/editor.zsh
source $ZDOTDIR/python.zsh

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

if command -v nix > /dev/null 2>&1; then
  source $ZDOTDIR/nix.zsh
fi

if command -v npm > /dev/null 2>&1; then
  source $ZDOTDIR/npm.zsh
fi

if command -v pacman > /dev/null 2>&1; then
  source $ZDOTDIR/pacman.zsh
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

if command -v task > /dev/null 2>&1; then
  source $ZDOTDIR/task.zsh
fi

if [[ -f $HOME/.secrets/vault/config ]]; then
  source $ZDOTDIR/vault.zsh
fi
