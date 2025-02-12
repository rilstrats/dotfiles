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

# shortcuts
[[ -f $ZDOTDIR/shortcuts.zsh ]] && source $ZDOTDIR/shortcuts.zsh

# aliases
# alias g=git
# alias v=$EDITOR
# alias vi=$EDITOR
# alias vim=$EDITOR

# zellij sessionizer
zd() {cd $ZELLIJ_SESSION_DIR}
zwd() {echo $ZELLIJ_SESSION_DIR}
alias zellijer=$HOME/.local/bin/zellij-sessionizer
alias zellijh=$HOME/.local/bin/zellij-home

# OLDPWD
od() {cd $OLDPWD}
owd() {echo $OLDPWD}

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

# bat => cat
[[ -x $(command -v bat) ]] && alias cat=bat

# cd => zoxide
if [[ -x $(command -v zoxide) ]]; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# topgrade
if [[ -x $(command -v topgrade) ]]; then
  alias upgrade="topgrade --yes --skip-notify --no-retry"
  alias update=upgrade
fi

# mise
[[ -x $(command -v mise) ]] && eval "$(mise activate zsh)"

# starship
[[ -x $(command -v starship) ]] && eval "$(starship init zsh)"

