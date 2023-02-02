# code
# export CODEPATH=$HOME/code # defined in .zshenv
alias code="cd $CODEPATH"

export CODESRC=$CODEPATH/src
alias codesrc="cd $CODESRC"

# export CODEBIN=$CODEPATH/bin
# alias codebin="cd $CODEBIN"

export CODEGH=$CODESRC/github.com
alias codegh="cd $CODEGH"

export CODEGHRS=$CODEGH/rilstrats
alias codeghrs="cd $CODEGHRS"
alias ghrs="cd $CODEGHRS"

export CODEGL=$CODESRC/gitlab.com
alias codegl="cd $CODEGL"

export CODEGLRS=$CODEGL/rilstrats
alias codeglrs="cd $CODEGLRS"
alias glrs="cd $CODEGLRS"


# cloud
if [[ -d $HOME/cloud ]]; then

  export CLOUDPATH=$HOME/cloud
  alias cloud="cd $CLOUDPATH"

  export CLOUDCOL=$CLOUDPATH/college
  alias cloudcol="cd $CLOUDCOL"

  export CLOUDSEM=$CLOUDCOL/23-1.winter
  alias cloudsem="cd $CLOUDSEM"

  export CLOUDTECH=$CLOUD/tech
  alias cloudtech="cd $CLOUDTECH"

  export CLOUDCYBER=$CLOUDTECH/cyber
  alias cloudcyber="cd $CLOUDCYBER"

  export CLOUDCOMP=$CLOUDCYBER/competitions
  alias cloudcomp="cd $CLOUDCOMP"

  export CLOUDNOTES=$CLOUDCYBER/notes
  alias cloudnotes="cd $CLOUDNOTES"

fi

# secret (for sensitive configuration files)
[[ -f $ZDOTDIR/.secrets.zsh ]] && source $ZDOTDIR/.secrets.zsh

# shortcuts (used by tmux-sessionizer)
export SHORTCUTS=($CLOUDSEM $CLOUDCOMP $CLOUDNOTES $CODEGHRS $CODEGLRS $CODESEC)

