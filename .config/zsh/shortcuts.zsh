# code
export CODEPATH="$HOME/code"
alias code="cd $CODEPATH"
export GOPATH="$CODEPATH"

export CODESRC="$CODEPATH/src"
alias codesrc="cd $CODESRC"

export CODEBIN="$CODEPATH/bin"
alias codebin="cd $CODEBIN"

export CODEGH="$CODESRC/github.com"
alias codegh="cd $CODEGH"

export CODEGHRS="$CODEGH/rilstrats"
alias codeghrs="cd $CODEGHRS"
alias ghrs="cd $CODEGHRS"

export CODEGL="$CODESRC/gitlab.com"
alias codegl="cd $CODEGL"

export CODEGLRS="$CODEGL/rilstrats"
alias codeglrs="cd $CODEGLRS"
alias glrs="cd $CODEGLRS"


# cloud
if [[ -d $HOME/cloud ]]; then

  export CLOUD="$HOME/cloud"
  alias cloud="cd $CLOUD"

  export CLOUDCOL="$CLOUD/college"
  alias cloudcol="cd $CLOUDCOL"

  export CLOUDSEM="$CLOUDCOL/22-9.fall"
  alias cloudsem="cd $CLOUDSEM"

  export CLOUDCYBER="$CLOUD/cyber"
  alias cloudcyber="cd $CLOUDCYBER"

  export CLOUDCOMP="$CLOUDCYBER/competitions"
  alias cloudcomp="cd $CLOUDCOMP"

  export CLOUDNOTES="$CLOUDCYBER/notes"
  alias cloudnotes="cd $CLOUDNOTES"

fi

# secret (for sensitive configuration files)
[[ -f "$ZDOTDIR/.secrets.zsh" ]] && source "$ZDOTDIR/.secrets.zsh"

# shortcuts (used by tmux-sessionizer)
export SHORTCUTS=($CLOUDSEM $CLOUDCOMP $CLOUDNOTES $CODEGHRS $CODEGLRS $CODESEC)

