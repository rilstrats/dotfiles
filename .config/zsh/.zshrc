# timing
# zmodload zsh/zprof

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
  vim() {[[ -z $(echo $PATH | grep nvm) ]] && nvm-lazy-load; $EDITOR $*}
  sudovim() {[[ -z $(echo $PATH | grep nvm) ]] && nvm-lazy-load; sudo $EDITOR $*}
else
  vim() {$EDITOR $*}
  sudovim() {sudo $EDITOR $*}
fi

# cat
# for bat theme use folke/tokyonight.nvim/extras/sublime
# cp tokyonight_night.tmTheme $HOME/.config/bat/themes
# bat cache --build
# bat --list-themes
[[ -z $(command -v bat) ]] && export BAT_THEME="tokyonight_night" && alias cat=bat

# ls
if [[ -z $(command -v exa) ]]; then
  # ls() {command exa --git}
  alias ls='exa --git'
  alias l='exa --git -la'
  alias la='exa --git -a'
  alias ll='exa --git -l'
  alias ll.='exa --git -lad .*'
else
  # ls() {command ls --color=auto}
  alias ls='ls --color=auto'
  alias l='ls -ohA --color=auto'
  alias la='ls -A --color=auto'
  alias ll='ls -oh --color=auto'
  alias l.='ls -ohAd .* --color=auto'
fi
# l() {ls -la}
# la() {ls -a}
# ll() {ls -l}
# l.() {ls -lad .*}

# games
# alias minecraft="$HOME/.minecraft/launcher/minecraft-launcher &> /dev/null & disown"
# alias discord="$XDG_CONFIG_HOME/Discord/Discord &> /dev/null & disown"

# docker
# alias hollywood='docker run --rm -it bcbcarl/hollywood'
# alias kali='docker run --rm -it kalilinux/kali-rolling'

# owd
od() {cd $OLDPWD}
owd() {echo $OLDPWD}

# tmux
td() {cd $TMUX_DIR}
alias tmuxer=$HOME/.local/bin/tmux-sessionizer
alias tmuxh=tmux-home
tmux-home() {
  if [[ -z $(tmux list-sessions | grep home) ]]; then
    tmux new-session -s home -c $HOME -e TMUX_DIR=$HOME
  else
    tmux attach-session -t home
  fi
}

# clean home
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
# alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# files
case $XDG_CURRENT_DESKTOP in
  KDE)
    alias files='dolphin . &> /dev/null & disown'
    ;;
  GNOME)
    alias files='nautilus . &> /dev/null & disown'
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

export GVIMINIT='let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" \
  : "$XDG_CONFIG_HOME/nvim/init.gvim" | source $MYGVIMRC'
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" \
  : "$XDG_CONFIG_HOME/nvim/init.lua" | source $MYVIMRC'

#######
# zsh #
#######

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
[[ -f $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme
[[ -f $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]] && \
  source $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh
[[ -f $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# p10k config
[[ -f $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh

# starship
# eval $(starship init zsh)

# timing
# zprof
