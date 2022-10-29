#!/bin/zsh

if [[ ! -z $(command -v lvim) ]]; then
  export EDITOR="$HOME/.local/bin/lvim"
elif [[ ! -z $(command -v nvim) ]]; then
  export EDITOR="/bin/nvim"
elif [[ ! -z $(command -v vim) ]]; then
  export EDITOR="/bin/vim"
else
  export EDITOR="/bin/vi"
fi

alias vim=$EDITOR
alias sudovim="sudo $EDITOR"

