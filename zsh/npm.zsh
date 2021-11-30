export PATH="$HOME/.npm_packages/bin:$PATH"
export NPM_PACKAGES="$HOME/.npm_packages"
export NODE_PATH="$NPM_PACKAGES/libs/node_modules:$NODE_PATH"


# init nvm
source /usr/share/nvm/init-nvm.sh

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