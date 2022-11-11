#!/bin/zsh

# go file conventions
export GOPATH="$HOME/dev"
export GOSRC="$GOPATH/src"
export GOBIN="$GOPATH/bin"

# development file system (using go conventions)
export DEVPATH="$GOPATH"
export DEVSRC="$GOSRC"
export DEVBIN="$GOBIN"

export DEVGH="$DEVSRC/github.com"
alias devgh="cd $DEVGH"

export DEVRS="$DEVGH/rilstrats"
alias devrs="cd $DEVRS"

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
[[ -f "$ZDOTDIR/secrets.zsh" ]] && source "$ZDOTDIR/secrets.zsh"

# shortcuts (used by tmux-sessionizer)
export SHORTCUTS=($NASSEM $NASCOMP $NASNOTES $DEVRS $DEVSEC)

