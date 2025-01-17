ZELLIJ_SHORTCUTS=($HOME/ $HOME/.dotfiles/)

# code
if [[ -d $HOME/code ]]; then
  export CODEPATH=$HOME/code # necessary cause used by git-codeclone
  ZELLIJ_SHORTCUTS+=($(fd -HI '.git$' $CODEPATH | sed 's|\.git/||'))
fi

# cloud
if [[ -d $HOME/cloud ]]; then
  EDU=$HOME/cloud/edu
  [[ -d $EDU ]] && ZELLIJ_SHORTCUTS+=($(fd -HI . $EDU --exact-depth 3 -t d))
  CYB=$HOME/cloud/tech/cyber
  [[ -d $CYB ]] && ZELLIJ_SHORTCUTS+=($(fd -HI . $CYB --exact-depth 1 -t d))
fi

export ZELLIJ_SHORTCUTS

