# tmux
if [[ -z "$TMUX" && "$TERM" == "alacritty" ]]; then
  # same as tmuxh function, just didn't want to define this early
  if [[ -z $(tmux list-sessions | grep home) ]]; then
    tmux new-session -s home -c $HOME 
  else
    tmux attach-session -t home
  fi
fi

# p10k instant prompt (output above, no output below)
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# p10k config
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

# shell
# setopt autocd beep extendedglob nomatch notify
bindkey -v # vim

# history
HISTFILE="$ZDOTDIR/histfile"
HISTSIZE=1000
SAVEHIST=1000

# autocomplete
# zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# plugins
[[ -f "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme" ]] && \
  source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"
[[ -f "$ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]] && \
  source "$ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
[[ -f "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# git (includes dotfile management)
[[ -f "$ZDOTDIR/git.zsh" ]] && source "$ZDOTDIR/git.zsh"

# environment (nvm and conda, lazy loaded)
[[ -f "$ZDOTDIR/environment.zsh" ]] && source "$ZDOTDIR/environment.zsh"

# shortcuts (and go variables)
[[ -f "$ZDOTDIR/shortcuts.zsh" ]] && source "$ZDOTDIR/shortcuts.zsh"

# path
export PATH="$DEVBIN:$PATH"


###########
# aliases #
###########

alias vim=$EDITOR
alias sudovim="sudo $EDITOR"

alias tmuxer=$HOME/.local/bin/tmux-sessionizer

#ls
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

# owd
alias owd='cd $OLDPWD'
alias oldpwd='echo $OLDPWD'

# tmux-sessionizer
alias tmuxer="$HOME/.local/bin/tmux-sessionizer"
tmuxh () {
  if [[ -z $(tmux list-sessions | grep home) ]]; then
    tmux new-session -s home -c $HOME 
  else
    tmux attach-session -t home
  fi
}

