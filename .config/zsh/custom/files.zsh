#!/bin/zsh

export GOPATH="$HOME/code"
export GOSRC="$GOPATH/src"
export GOBIN="$GOPATH/bin"

export GOGH="$GOSRC/github.com"
alias gogh="cd $GOGH"

export GORS="$GOGH/rilstrats"
alias gors="cd $GORS"

if [[ -d $HOME/mega ]]; then

  export MEGA="$HOME/mega"
  alias mega="cd $MEGA"

  export MEGACOL="$MEGA/college"
  alias megacol="cd $MEGACOL"

  export MEGASEM="$MEGACOL/22-9.fall"
  alias megasem="cd $MEGASEM"

fi

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

