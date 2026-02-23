# options
# share history between sessions
setopt SHARE_HISTORY
# save timestamp as well as command
setopt EXTENDED_HISTORY
# remove extra whitespace from commands
setopt HIST_REDUCE_BLANKS
# if the same command is run twice in a row, only save the first
setopt HIST_IGNORE_DUPS 
# when trimming the history file, remove duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
bindkey -v # vim

# history
export HISTFILE=$XDG_STATE_HOME/zsh/history
# it is recommended that HISTSIZE be 20% larger than SAVEHIST
export HISTSIZE=120000
export SAVEHIST=100000

# autocomplete
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
export FPATH=$ZDOTDIR/func:$FPATH
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/riley/.config/zsh/.zshrc'

autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
# End of lines added by compinstall

# plugins
[[ -f $XDG_DATA_HOME/zsh/vi-mode/zsh-vi-mode.plugin.zsh ]] && \
  source $XDG_DATA_HOME/zsh/vi-mode/zsh-vi-mode.plugin.zsh
[[ -f $XDG_DATA_HOME/zsh/autosuggestions/zsh-autosuggestions.zsh ]] && \
  source $XDG_DATA_HOME/zsh/autosuggestions/zsh-autosuggestions.zsh
[[ -f $XDG_DATA_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh ]] && \
  source $XDG_DATA_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh

# zellij sessionizer
sd() {cd $SESSIONIZER_DIR}
swd() {echo $SESSIONIZER_DIR}
alias zellijer=$HOME/.local/bin/zellij-sessionizer
alias zellijh=$HOME/.local/bin/zellij-home

if [[ $TERM == "alacritty" ||\
      $TERM == "xterm-256color" ||\
      $TERM == "tmux-256color" ]]; then
  use_nerd_font=1
fi

# ls => exa
if [[ -x $(command -v eza) ]]; then
  if [[ -n $use_nerd_font ]]; then
    alias ls='eza --git --group-directories-first --icons'
  else
    alias ls='eza --git --group-directories-first'
  fi
  alias la='ls -a'
  alias ll='ls -l'
  alias l='ls -la'
else
  alias ls='ls --color=auto --group-directories-first'
  alias la='ls -A'
  alias ll='ls -oh'
  alias l='ls -ohA'
fi

# topgrade
if [[ -x $(command -v topgrade) ]]; then
  alias upgrade="topgrade --yes --skip-notify --no-retry"
  alias update=upgrade
fi

# mise
[[ -x $(command -v mise) ]] && eval "$(mise activate zsh)"

# starship
[[ -x $(command -v starship) ]] && \
  [[ -n $use_nerd_font ]] && \
  eval "$(starship init zsh)"

