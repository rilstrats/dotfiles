# tmux
if [[ -z "$TMUX" && "$TERM" != "xterm-256color" ]]; then
  # tmux attach || tmux
  tmux
fi 

# p10k instant prompt (things with output above, no output below)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# history
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000

# autocomplete
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# go
export GOPATH="$HOME/code"
export GOSRC="$GOPATH/src"
export GOBIN="$GOPATH/bin"

export GOGH="$GOSRC/github.com"
alias gogh="cd $GOGH"

export GORS="$GOGH/rilstrats"
alias gors="cd $GORS"

# path
export PATH="$PATH:$GOBIN:$HOME/.local/bin"

# mega
export MEGA="$HOME/mega"
alias mega="cd $MEGA"

export MEGACOL="$MEGA/college"
alias megacol="cd $MEGACOL"

export MEGASEM="$MEGACOL/22-9.fall"
alias megasem="cd $MEGASEM"

# editor
export EDITOR="$HOME/.local/bin/lvim"
alias vim=$EDITOR
alias vimp='/usr/bin/vim'

# themes and plugins
export ZSH="$HOME/.config/zsh"
source $ZSH/theme/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/plugin/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $ZSH/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

# files
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

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles

alias ls='ls --color=auto'
alias l='ls -la --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias l.='ls -d .* --color=auto'
alias ll.='ls -l -d .* --color=auto'

alias minecraft='~/.minecraft/launcher/minecraft-launcher &'
alias hollywood='sudo docker run --rm -it bcbcarl/hollywood'

# secrets
[[ -f $HOME/.secret.zsh ]] && source $HOME/.secret.zsh

# nvm
if [[ -d "$HOME/.config/nvm" ]]; then
  export NVM_DIR="$HOME/.config/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # loads nvm autocompletion (bash_completion)

  [[ ! -z $(command -v ng) ]] && source <(ng completion script) # loads angular autocompletion
fi

# p10k config
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

