#!/bin/zsh

if [[ -d "$XDG_CONFIG_HOME/nvm" ]]; then
  export NVM_DIR="$XDG_CONFIG_HOME/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # loads nvm autocompletion (bash_completion)

  [[ ! -z $(command -v ng) ]] && source <(ng completion script) # loads angular autocompletion
fi

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

