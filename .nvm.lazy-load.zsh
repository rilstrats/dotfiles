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

