# .dotfiles

This repo is used to store my personal dotfiles. Enjoy!

## Dependencies

### Packages

Fedora: 

```bash
sudo dnf install i3-gaps rofi polybar tmux alacritty nvim zsh xss-lock xautolock xset scrot wmctrl ImageMagick dunst gh brightnessctl fzf fd-find ripgrep
```

### Submodules

By cloning these dotfiles and setting up the submodules, you are also installing:

- https://github.com/romkatv/powerlevel10k/tree/master
- https://github.com/zsh-users/zsh-autosuggestions/tree/master
- https://github.com/zsh-users/zsh-syntax-highlighting/tree/master
- https://github.com/jeffreytse/zsh-vi-mode/tree/master
- https://github.com/meskarune/i3lock-fancy

### Other

You will have to go follow these links and install them to use them:

- https://github.com/nvm-sh/nvm
- https://www.lunarvim.org/01-installing.html

## Install

Run the following commands to bare clone this repo, checkout this files, and install the submodules.

```bash
git clone --bare https://github.com/rilstrats/.dotfiles.git $HOME/.dotfiles.git

/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME checkout -f
/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME submodule init
/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME submodule update

cd $HOME/.config/i3/i3lock-fancy; sudo make install
```

### Permanent Aliases

Note, if you are cloning this repo, you will not need to create these aliases, they are already in `~/.zshrc`.

```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dfs=dotfiles" >> $HOME/.zshrc
```

This enables you to use commands such as `dfs status` just like `git status` to manage the dotfiles.

### Laptop

On a laptop with a high DPI screen, you will want to run this command.

```bash
ln $HOME/.Xresources.laptop $HOME/.Xresources
```
