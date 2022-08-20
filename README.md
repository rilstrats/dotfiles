# .dotfiles

## Install

```
cd $HOME
git clone --bare https://github.com/rilstrats/.dotfiles.git

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles

dfs checkout -f
dfs submodule init
dfs submodule update
```
