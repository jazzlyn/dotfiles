# make less more productive based on http://serebrov.github.io/html/2014-01-04-git-log-and-less-keep-output.html
# -i - ignore case when searching (but respect case if search term contains uppercase letters)
# -X - do not clear screen on exit
# -F - exit if text is less then one screen long
# -R - was on by default on my system, something related to colors<Paste>
export LESS=-iXFR

# XDG https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

export XDG_CACHE_HOME=$HOME/.cache
[[ ! -d $XDG_CACHE_HOME ]] && command mkdir -p "$XDG_CACHE_HOME"

export XDG_CONFIG_HOME=$HOME/.config
[[ ! -d $XDG_CONFIG_HOME ]] && command mkdir -p "$XDG_CONFIG_HOME"

export XDG_DATA_HOME=$HOME/.local/share
[[ ! -d $XDG_DATA_HOME ]] && command mkdir -p "$XDG_DATA_HOME"

export XDG_CONFIG_DIRS=$HOME/.dotfiles

export XDG_DOWNLOAD_DIR=$HOME/Downloads
[[ ! -d $XDG_DOWNLOAD_DIR ]] && command mkdir -p "$XDG_DOWNLOAD_DIR"

ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir -p "$XDG_CACHE_HOME/zsh"

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
