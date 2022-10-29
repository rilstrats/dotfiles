#!/bin/zsh

# dotfiles
export DOTFILES="$HOME/.dotfiles.git/"
alias dotfiles='/bin/git --git-dir=$DOTFILES --work-tree=$HOME'
alias dfs=dotfiles

