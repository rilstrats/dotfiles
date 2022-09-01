# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# history
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000

# go
export GOPATH="$HOME/code"
export GOSRC="$GOPATH/src"
export GOBIN="$GOPATH/bin"

alias gogh="cd $GOSRC/github.com"
alias gors="cd $GOSRC/github.com/rilstrats"
alias gors="cd $GOSRC/github.com/byui-csa"

# export GOGH="$GOSRC/github.com"
# export GORS="$GOGH/rilstrats"
# export GOCSA="$GOGH/byui-csa"
# alias gogh="cd $GOGH"
# alias gors="cd $GORS"
# alias gocsa="cd $GOCSA"

# path
export PATH="$PATH:$GOBIN:$HOME/.local/bin"

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

# editor
export EDITOR=nvim
alias vim=nvim

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles

alias minecraft='~/.minecraft/launcher/minecraft-launcher &'

alias ls='ls --color'
alias l='ls -la'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

