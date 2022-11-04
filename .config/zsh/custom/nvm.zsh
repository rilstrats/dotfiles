#!/bin/zsh

if [[ -z $(command -v nvm) ]]; then
  nvm () {
    [[ -z $(echo $NVM_DIR) ]] && nvm-setup
    nvm $*
    # node-path
  }
fi

npm () {
  [[ -z $(echo $NVM_DIR) ]] && nvm-setup
  # $NODE_PATH/npm $*
  npm $*
}

node () {
  [[ -z $(echo $NVM_DIR) ]] && nvm-setup
  # $NODE_PATH/node $*
  node $*
}

ng () {
  [[ -z $(echo $NVM_DIR) ]] && nvm-setup
  # $NODE_PATH/ng $*
  ng $*
}

nvm-setup () {
  export NVM_DIR="$XDG_CONFIG_HOME/nvm"
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # loads nvm

  # [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # loads nvm autocompletion (bash_completion)
  # [[ ! -z $(command -v ng) ]] && source $(ng completion script) # loads angular autocompletion
  
  nvm use default
  # node-path
}

node-path () {
  export NODE_PATH=$(echo $PATH | tr ':' '\n' | grep nvm)
}

# deprecated

# lazy load script
# nvm() {
#    
#     if [[ load_nvm ]]; then
#       nvm "$@"
#     fi

# }

# load_nvm() {

#   if [[ -d "$HOME/.config/nvm" ]]; then

#     if [[ -z "$NVM_DIR" ]]; then
#       export NVM_DIR="$HOME/.config/nvm"
#       [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
#       [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#       # angular autocompletion
#       [[ ! -z $(command -v ng) ]] && source <(ng completion script)
#     fi

#     return true

#   else 
#     echo "nvm isn't installed"
#     return false

#   fi
# }

