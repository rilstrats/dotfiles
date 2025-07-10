ZELLIJ_SHORTCUTS=($HOME/ $HOME/.dotfiles/ $HOME/.dotfiles/.config/nvim)

# code
if [[ -d $HOME/code ]]; then
  export CODEPATH=$HOME/code # necessary cause used by git-codeclone
  if command -v fd &> /dev/null; then
    ZELLIJ_SHORTCUTS+=($(fd -HI '.git$' $CODEPATH | sed 's|\.git/||'))
  else
    ZELLIJ_SHORTCUTS+=($(find $CODEPATH -name ".git" | sed 's|\.git||'))
  fi
fi

# cloud
if [[ -d $HOME/cloud ]]; then
  EDU=$HOME/cloud/edu
  CYB=$HOME/cloud/tech/cyber

  if command -v fd &> /dev/null; then
    [[ -d $EDU ]] && ZELLIJ_SHORTCUTS+=($(fd -u . $EDU --exact-depth 3 -t d))
    [[ -d $CYB ]] && ZELLIJ_SHORTCUTS+=($(fd -u . $CYB --exact-depth 1 -t d))
  else
    [[ -d $EDU ]] && ZELLIJ_SHORTCUTS+=($(find $EDU -mindepth 3 -maxdepth 3 -type d))
    [[ -d $CYB ]] && ZELLIJ_SHORTCUTS+=($(find $CYB -mindepth 3 -maxdepth 3 -type d))
  fi
fi

export ZELLIJ_SHORTCUTS

