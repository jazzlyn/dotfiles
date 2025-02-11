# Less settings
# -i: ignore case when there is no uppercase
# -X: keep content on screan after quitting
# -F: quit if one screen
# -R: process ANSI color escape sequences (without -R: \033[31m)
export LESS=-iXFR

# https://specifications.freedesktop.org/basedir-spec/latest/
# https://wiki.archlinux.org/title/XDG_Base_Directory

# User Directories

export XDG_CACHE_HOME=$HOME/.cache
[[ ! -d $XDG_CACHE_HOME ]] && mkdir -p "$XDG_CACHE_HOME"

export XDG_CONFIG_HOME=$HOME/.config
[[ ! -d $XDG_CONFIG_HOME ]] && mkdir -p "$XDG_CONFIG_HOME"

export XDG_DATA_HOME=$HOME/.local/share
[[ ! -d $XDG_DATA_HOME ]] && mkdir -p "$XDG_DATA_HOME"

export XDG_STATE_HOME=$HOME/.local/state
[[ ! -d $XDG_STATE_HOME ]] && mkdir -p "$XDG_STATE_HOME"

# zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p "$ZSH_CACHE_DIR"

# System Directories

export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# XDG_RUNTIME_DIR is set by pam_systemd

export PATH=/usr/local/bin:$HOME/bin:$HOME/.local/bin:$PATH
