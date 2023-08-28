# You need to source nvm before you can use it. Do one of the following
# or similar depending on your shell (and then restart your shell):

#   echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
#   echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc

# You can now install node.js versions (e.g. nvm install 10) and
# activate them (e.g. nvm use 10).

# init-nvm.sh is a convenience script which does the following:

# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/nvm.sh
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec


# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# if nvmrc is present in project then load nvm version automatically
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use --silence
  elif [[ $(nvm version) != $(nvm version system)  ]]; then
    # echo "Reverting to nvm system version"
    nvm use system --silence
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
