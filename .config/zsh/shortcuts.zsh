# code
if [[ -d $HOME/code ]]; then
  export CODEPATH=$HOME/code
  alias codepath="cd $CODEPATH"
fi

# cloud
if [[ -d $HOME/cloud ]]; then
  export CLOUDPATH=$HOME/cloud
  alias cloudpath="cd $CLOUDPATH"

  export CLOUDEDU=$CLOUDPATH/education
  alias cloudedu="cd $CLOUDEDU"

  export CLOUDCYBER=$CLOUDPATH/tech/cyber
  alias cloudcyber="cd $CLOUDCYBER"
fi

# shortcuts (used by tmux-sessionizer)
export SHORTCUTS=($CLOUDCYBER)

