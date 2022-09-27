# tmux
if [[ -z "$TMUX" && "$TERM" != "xterm-256color" ]]; then
  # tmux attach || tmux
  tmux
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
export XDG_RUNTIME_DIR="$HOME/.local/bin"

# zsh
setopt autocd beep extendedglob nomatch notify
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
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# code (go conventions)
export GOPATH="$HOME/code"
export GOSRC="$GOPATH/src"
export GOBIN="$GOPATH/bin"

export GOGH="$GOSRC/github.com"
alias gogh="cd $GOGH"

export GORS="$GOGH/rilstrats"
alias gors="cd $GORS"

# path
export PATH="$PATH:$GOBIN:$XDG_RUNTIME_DIR"

# dotfiles
alias dotfiles='/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles

# git
g () {
  if [[ -z $(git status 2> /dev/null) ]]; then
    /bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME $*
  else
    /bin/git $*
  fi
}

gs () {g status}
gd () {g diff}

ga () {g add $*}
gcm () {g commit -m $1}
gp () {g push}

gf () {g fetch}
gpu () {g pull}

gacm () {ga .; gcm $1}
gacmp () {ga .; gcm $1; gp}

grv () {g remote -v}

grso-ssh () {
  repo=$(git remote -v | head -n 1 | sed "s/^.*\.com[/:]//g" | sed "s/ (.*$//g" | sed "s/\.git$//g")
  read "?Is git@github.com:$repo.git correct? [Y/n]: " input
  correct=`echo ${input:0:1} | tr '[:upper:]' '[:lower:]'`
  echo

  if [[ "$correct" == "n" ]]; then
    echo "Origin not updated, please update by hand with: "
    echo "git remote set-url origin git@github.com:USER/REPO.git"
    return
  fi

  git remote set-url origin git@github.com:$repo.git
  echo "Origin updated to:"
  git remote -v
}

# mega
export MEGA="$HOME/mega"
alias mega="cd $MEGA"

export MEGACOL="$MEGA/college"
alias megacol="cd $MEGACOL"

export MEGASEM="$MEGACOL/22-9.fall"
alias megasem="cd $MEGASEM"

# editor
if [[ ! -z $(command -v lvim) ]]; then
  export EDITOR="$XDG_RUNTIME_DIR/lvim"
elif [[ ! -z $(command -v nvim) ]]; then
  export EDITOR="/bin/nvim"
elif [[ ! -z $(command -v vim) ]]; then
  export EDITOR="/bin/vim"
else
  export EDITOR="/bin/vi"
fi

alias vim=$EDITOR

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
alias l='ls -la --color=auto'

alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'

alias l.='ls -d .* --color=auto'
alias ll.='ls -ld .* --color=auto'

# games
alias minecraft="$HOME/.minecraft/launcher/minecraft-launcher & &> /dev/null"

# docker
alias hollywood='docker run --rm -it bcbcarl/hollywood'
alias kali='docker run --rm -it kalilinux/kali-rolling'

# secret
[[ -f "$HOME/.config/zsh/secret.zsh" ]] && source $HOME/.config/zsh/secret.zsh

# nvm
if [[ -d "$XDG_CONFIG_HOME/nvm" ]]; then
  export NVM_DIR="$XDG_CONFIG_HOME/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # loads nvm autocompletion (bash_completion)

  [[ ! -z $(command -v ng) ]] && source <(ng completion script) # loads angular autocompletion
fi

# p10k config
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

