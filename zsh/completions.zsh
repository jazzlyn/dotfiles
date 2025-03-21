zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# Command completion options
setopt auto_list
setopt complete_aliases
setopt no_list_ambiguous

# enable autocompletion feature
autoload -Uz compinit promptinit
compinit
promptinit

autoload -U +X bashcompinit && bashcompinit

# enable cursor menu to select items from autocompletion
zstyle ':completion:*' menu select

# enable privileged autocompletion (sudo)
zstyle ':completion::complete:*' gain-privileges 1

if [[ -v $IN_NIX_SHELL && -f $(ls $NIX_STORE/*zsh-syntax-highlighting*/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh) ]]; then
  source $(ls $NIX_STORE/*zsh-syntax-highlighting*/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh)
elif [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "zsh-syntax-highlighting not found"
fi
