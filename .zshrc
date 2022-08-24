# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Go
export GOPATH="$HOME/code"

# Something to do with vim
bindkey -v

# Autocomplete
zstyle :compinstall filename '/home/rilstrats/.zshrc'
autoload -Uz compinit
compinit

# Themes and Plugins
export ZSH="$HOME/.config/zsh"
source $ZSH/theme/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/plugin/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $ZSH/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

# Editor
export EDITOR=nvim
alias vim=nvim

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles

alias minecraft='~/.minecraft/launcher/minecraft-launcher &'

alias ls='ls --color'
alias l='ls -la'

alias rs='cd $HOME/code/src/github.com/rilstrats/'
alias csa='cd $HOME/code/src/github.com/byui-csa/'
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

