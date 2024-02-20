# startX
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# Directory options
#setopt auto_cd
setopt pushd_to_home

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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

if command -v az > /dev/null 2>&1; then
  source $ZDOTDIR/azure.zsh
fi

if command -v direnv > /dev/null 2>&1; then
  source $ZDOTDIR/direnv.zsh
fi

if command -v gcloud > /dev/null 2>&1; then
  source $ZDOTDIR/gcloud.zsh
fi

# if command -v gnome-keyring > /dev/null 2>&1; then
#   source $ZDOTDIR/gnome-keyring.zsh
# fi

if command -v go > /dev/null 2>&1; then
  source $ZDOTDIR/go.zsh
fi

source $ZDOTDIR/kubernetes.zsh

[[ -f $HOME/.secrets/aws/minio-config ]] && source $ZDOTDIR/minio.zsh

if command -v nix > /dev/null 2>&1; then
  source $ZDOTDIR/nix.zsh
fi

if command -v npm > /dev/null 2>&1; then
  source $ZDOTDIR/npm.zsh
fi

if [[ -f /usr/share/nvm/init-nvm.sh ]]; then
  source $ZDOTDIR/nvm.zsh
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
else
  echo "spaceship-prompt not found"
fi

[[ -d $HOME/.secrets/vault ]] && source $ZDOTDIR/vault.zsh

if command -v keychain > /dev/null 2>&1; then
  keychain -q --nogui id_ed25519
fi
