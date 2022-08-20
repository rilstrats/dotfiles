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

## Permanent Aliases

Note, if you are cloning this repo, you will not need to create these aliases, they are already in `~/.zshrc`.

```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles" | sudo tee -a $HOME/.zshrc
```

This enables you to use commands such as `dfs status` just like `git status` to manage the dotfiles.
