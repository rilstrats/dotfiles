# .dotfiles

## Install

```
cd $HOME
git clone --bare https://github.com/rilstrats/.dotfiles.git

/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME checkout -f
/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME submodule init
/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME submodule update
```

## Permanent Aliases

Note, if you are cloning this repo, you will not need to create these aliases, they are already in `~/.zshrc`.

```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles" >> $HOME/.zshrc
```

This enables you to use commands such as `dfs status` just like `git status` to manage the dotfiles.
