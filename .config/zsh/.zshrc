# tmux
if [[ -z $TMUX && $TERM == alacritty ]]; then
  if [[ -z $(tmux list-sessions | grep home) ]]; then
    tmux new-session -s home -c $HOME -e TMUX_DIR=$HOME
  else
    tmux attach-session -t home
  fi
fi

# p10k instant prompt (output above, no output below)
[[ -r ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh ]] && \
  source ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh

# git (includes dotfile management)
[[ -f $ZDOTDIR/git.zsh ]] && source $ZDOTDIR/git.zsh

# virtual environments (nvm and conda/mamba, lazy loaded)
[[ -f $ZDOTDIR/venv.zsh ]] && source $ZDOTDIR/venv.zsh

# shortcuts (and go variables)
[[ -f $ZDOTDIR/shortcuts.zsh ]] && source $ZDOTDIR/shortcuts.zsh

# path
export PATH=$PATH


###########
# aliases #
###########

if [[ $EDITOR == $HOME/.local/bin/lvim ]]; then
  vim() {[[ -z $(echo $PATH | grep nvm) ]] && nvm-setup; $EDITOR $*}
  sudovim() {[[ -z $(echo $PATH | grep nvm) ]] && nvm-setup; sudo $EDITOR $*}
else
  vim() {$EDITOR $*}
  sudovim() {sudo $EDITOR $*}
fi

# ls
alias ls='ls --color=auto'
alias l='ls -ohA --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -oh --color=auto'
alias l.='ls -d .* --color=auto'
alias ll.='ls -ohd .* --color=auto'

# games
alias minecraft="$HOME/.minecraft/launcher/minecraft-launcher &> /dev/null & disown"
# alias discord="$XDG_CONFIG_HOME/Discord/Discord &> /dev/null & disown"

# docker
alias hollywood='docker run --rm -it bcbcarl/hollywood'
alias kali='docker run --rm -it kalilinux/kali-rolling'

# owd
alias owd='cd $OLDPWD'
alias oldpwd='echo $OLDPWD'

# tmux
alias td='cd $TMUX_DIR'
alias tmuxer=$HOME/.local/bin/tmux-sessionizer
alias tmuxh=tmux-home
tmux-home() {
  if [[ -z $(tmux list-sessions | grep home) ]]; then
    tmux new-session -s home -c $HOME -e TMUX_DIR=$HOME
  else
    tmux attach-session -t home
  fi
}

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
      alias files='thunar . &> /dev/null & disown'
    elif [[ ! -z $(command -v nautilus) ]]; then
      alias files='nautilus . &> /dev/null & disown'
    elif [[ ! -z $(command -v dolphin) ]]; then
      alias files='dolphin . &> /dev/null & disown'
    fi
    ;;
  *)
    alias files="echo 'Unsupported Desktop Environment'"
    ;;
esac


#######
# zsh #
#######

# shell
# setopt autocd beep extendedglob nomatch notify
setopt inc_append_history
bindkey -v # vim

# history
HISTFILE=$ZDOTDIR/histfile
HISTSIZE=1000
SAVEHIST=1000

# autocomplete
# zstyle ':completion:*' completer _complete _ignored _approximate
fpath+=$ZDOTDIR/functions
zstyle :compinstall filename $ZDOTDIR/.zshrc
autoload -Uz compinit
compinit

# p10k config
[[ -f $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh

# plugins
[[ -f $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme
[[ -f $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]] && \
  source $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh
[[ -f $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

