#!/bin/zsh

# go file conventions
export GOPATH="$HOME/code"
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

if [[ -d $HOME/mega ]]; then

  export NAS="$HOME/mega"
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
  export nasnotes="cd $NASNOTES"

fi

# secret (for sensitive configuration files)
[[ -f "$ZSH/secret.zsh" ]] && source "$ZSH/secret.zsh"

# shortcuts (used by tmux-sessionizer)
export SHORTCUTS=($NASSEM $NASCOMP $NASNOTES $DEVRS $DEVSEC)

# files alias
case $XDG_CURRENT_DESKTOP in
  KDE)
    alias files='dolphin . &> /dev/null &'
    ;;

  GNOME)
    alias files='nautilus . &> /dev/null &'
    ;;

  i3 | XFCE)

    if [[ ! -z $(command -v thunar) ]]; then
      alias files='thunar . &> /dev/null &'

    elif [[ ! -z $(command -v nautilus) ]]; then
      alias files='nautilus . &> /dev/null &'

    elif [[ ! -z $(command -v dolphin) ]]; then
      alias files='dolphin . &> /dev/null &'

    fi
    ;;

  *)
    alias files="echo 'Unsupported Desktop Environment'"
    ;;
esac

