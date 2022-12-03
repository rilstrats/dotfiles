# development
export DEVPATH="$HOME/dev"
alias dev="cd $DEVPATH"
export GOPATH="$DEVPATH"

export DEVSRC="$DEVPATH/src"
alias devsrc="cd $DEVSRC"
export GOSRC="$DEVSRC"

export DEVBIN="$DEVPATH/bin"
alias devbin="cd $DEVBIN"
export GOBIN="$DEVBIN"

export DEVGH="$DEVSRC/github.com"
alias devgh="cd $DEVGH"

export DEVGHRS="$DEVGH/rilstrats"
alias devghrs="cd $DEVGHRS"
alias ghrs="cd $DEVGHRS"

export DEVGL="$DEVSRC/gitlab.com"
alias devgl="cd $DEVGL"

export DEVGLRS="$DEVGL/rilstrats"
alias devglrs="cd $DEVGLRS"
alias glrs="cd $DEVGLRS"

# nas
if [[ -d $HOME/nas ]]; then

  export NAS="$HOME/nas"
  alias nas="cd $NAS"

  export NASCOL="$NAS/college"
  alias nascol="cd $NASCOL"

  export NASSEM="$NASCOL/22-9.fall"
  alias nassem="cd $NASSEM"

  export NASCYBER="$NAS/cyber"
  alias nascyber="cd $NASCYBER"

  export NASCOMP="$NASCYBER/competitions"
  alias nascomp="cd $NASCOMP"

  export NASNOTES="$NASCYBER/notes"
  alias nasnotes="cd $NASNOTES"

fi

# secret (for sensitive configuration files)
[[ -f "$ZDOTDIR/.secrets.zsh" ]] && source "$ZDOTDIR/.secrets.zsh"

# shortcuts (used by tmux-sessionizer)
export SHORTCUTS=($NASSEM $NASCOMP $NASNOTES $DEVGHRS $DEVGLRS $DEVSEC)

