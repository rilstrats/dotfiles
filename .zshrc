#!/bin/zsh

# tmux
if [[ -z "$TMUX" && "$TERM" != "xterm-256color" ]]; then
  # tmux # new-session
  # $HOME/.local/bin/tmux-sessionizer $HOME
  # tmux attach-session || $HOME/.local/bin/tmux-sessionizer $HOME
  tmux attach-session -t "home" || tmux new-session -s "home" -c $HOME 
fi 

# p10k instant prompt (things with output above, no output below)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh
# setopt autocd beep extendedglob nomatch notify
bindkey -v # vim
export ZSH="$XDG_CONFIG_HOME/zsh"

# themes and plugins
source $ZSH/theme/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/plugin/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $ZSH/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

# history
HISTFILE="$ZSH/histfile"
HISTSIZE=1000
SAVEHIST=1000

# autocomplete
# zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# go
[[ -f "$ZSH/go.zsh" ]] && source "$ZSH/go.zsh"

# path
export PATH="$HOME/.local/bin:$GOBIN:$PATH"

# secret
[[ -f "$ZSH/secret.zsh" ]] && source "$ZSH/secret.zsh"

# mega
[[ -f "$ZSH/mega.zsh" ]] && source "$ZSH/mega.zsh"

# dotfiles
export DOTFILES="$HOME/.dotfiles.git/"
alias dotfiles='/bin/git --git-dir=$DOTFILES --work-tree=$HOME'
alias dfs=dotfiles

# git
[[ -f "$ZSH/git.zsh" ]] && source $ZSH/git.zsh

# editor
if [[ ! -z $(command -v lvim) ]]; then
  export EDITOR="$HOME/.local/bin/lvim"
elif [[ ! -z $(command -v nvim) ]]; then
  export EDITOR="/bin/nvim"
elif [[ ! -z $(command -v vim) ]]; then
  export EDITOR="/bin/vim"
else
  export EDITOR="/bin/vi"
fi

alias vim=$EDITOR
alias sudovim="sudo $EDITOR"


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

# ls
alias ls='ls --color=auto'
alias l='ls -ohA --color=auto'

alias la='ls -A --color=auto'
alias ll='ls -oh --color=auto'

alias l.='ls -d .* --color=auto'
alias ll.='ls -ohd .* --color=auto'

# games
alias minecraft="$HOME/.minecraft/launcher/minecraft-launcher & &> /dev/null"

# docker
alias hollywood='docker run --rm -it bcbcarl/hollywood'
alias kali='docker run --rm -it kalilinux/kali-rolling'

# nvm
if [[ -d "$XDG_CONFIG_HOME/nvm" ]]; then
  export NVM_DIR="$XDG_CONFIG_HOME/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # loads nvm autocompletion (bash_completion)

  [[ ! -z $(command -v ng) ]] && source <(ng completion script) # loads angular autocompletion
fi

# p10k config
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

