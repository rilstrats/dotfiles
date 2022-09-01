# tmux
if [ -z "$TMUX" ]; then
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

# something to do with vim
bindkey -v

# autocomplete
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# themes and plugins
export ZSH="$HOME/.config/zsh"
source $ZSH/theme/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/plugin/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $ZSH/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

# go
export GOPATH="$HOME/code"
export GOSRC="$GOPATH/src"
export GOBIN="$GOPATH/bin"

export GOGH="$GOSRC/github.com"
export GORS="$GOGH/rilstrats"
export GOCSA="$GOGH/byui-csa"

alias gogh="cd $GOGH"
alias gors="cd $GORS"
alias gocsa="cd $GOCSA"

# path
export PATH="$PATH:$GOBIN:$HOME/.local/bin"

# mega
export MEGA="$HOME/mega"
export MEGACOL="$MEGA/college"
export MEGASEM="$MEGACOL/2022-3.summer"

alias mega="cd $MEGA"
alias megacol="cd $MEGACOL"
alias megasem="cd $MEGASEM"

# editor
export EDITOR='/bin/nvim'
alias vim='/bin/nvim'
alias vimp='/bin/vim'

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles

alias ls='ls --color'
alias l='ls -la'

alias minecraft='~/.minecraft/launcher/minecraft-launcher &'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

