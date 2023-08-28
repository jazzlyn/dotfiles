export PATH=$HOME/.local/bin/:$PATH
export NPM_PACKAGES=$HOME/.npm
export NODE_PATH=$NPM_PACKAGES/libs/node_modules:$NODE_PATH

export npm_config_prefix="$HOME/.local"
export npm_config_message="release: %s"
export npm_config_commit_hooks=true
export npm_config_sign_git_tag=true
