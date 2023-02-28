# options
# setopt autocd beep extendedglob nomatch notify
setopt inc_append_history hist_ignore_dups
bindkey -v # vim

# history
export HISTFILE=$XDG_STATE_HOME/zsh/history
export HISTSIZE=1000
export SAVEHIST=1000

# autocomplete
# zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
export FPATH=$ZDOTDIR/functions:$FPATH
zstyle :compinstall filename $ZDOTDIR/.zshrc
autoload -Uz compinit
compinit -d $$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# plugins
[[ -f $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]] && \
  source $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh
[[ -f $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $ZDOTDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && \
  source $ZDOTDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# custom plugins
[[ -f $ZDOTDIR/git.zsh ]] && source $ZDOTDIR/git.zsh
[[ -f $ZDOTDIR/home.zsh ]] && source $ZDOTDIR/home.zsh
[[ -f $ZDOTDIR/tmux.zsh ]] && source $ZDOTDIR/tmux.zsh
[[ -f $ZDOTDIR/shortcuts.zsh ]] && source $ZDOTDIR/shortcuts.zsh

# aliases/functions
od() {cd $OLDPWD}
owd() {echo $OLDPWD}
open() {xdg-open $* &> /dev/null & disown}

files() {
  DIR=$1
  [[ -z DIR ]] && DIR='.'
  case $XDG_CURRENT_DESKTOP in
    (KDE)
      dolphin $DIR &> /dev/null & disown
      ;;
    (GNOME)
      nautilus $DIR &> /dev/null & disown
      ;;
    (XFCE)
      thunar $DIR &> /dev/null & disown
      ;;
    (i3)
      if [[ -x $(command -v thunar) ]]; then
        thunar $DIR &> /dev/null & disown
      elif [[ -x $(command -v nautilus) ]]; then
        nautilus $DIR &> /dev/null & disown
      elif [[ -x $(command -v dolphin) ]]; then
        dolphin $DIR &> /dev/null & disown
      fi
      ;;
    (*)
      echo "Unsupported Desktop Environment"
      ;;
  esac
}

# ls => exa
if [[ -x $(command -v exa) ]]; then
  alias l='exa --git -la'
  alias ls='exa --git'
  alias la='exa --git -a'
  alias ll='exa --git -l'
  alias l.='exa --git -lad .*'
else
  alias l='ls --color=auto -ohA'
  alias ls='ls --color=auto'
  alias la='ls --color=auto -A'
  alias ll='ls --color=auto -oh'
  alias l.='ls --color=auto -ohAd .*'
fi

# cd => zoxide
if [[ -x $(command -v zoxide) ]]; then
  eval "$(zoxide init zsh)"
  alias cd=z
fi

# cat => bat
[[ -x $(command -v bat) ]] && alias cat=bat

# grep => rg
[[ -x $(command -v rg) ]] && alias grep=rg

# rtx
[[ -x $(command -v rtx) ]] && eval "$(rtx activate zsh)"

# starship
[[ -x $(command -v rtx) ]] && eval "$(starship init zsh)"
