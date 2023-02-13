# dotfiles

This repo is used to store my personal dotfiles. Enjoy!

## Dependencies

### Packages

Fedora: 

```bash
sudo dnf install dunst i3 rofi feh
brightnessctl polybar wmctrl xset \
alacritty gh nvim tmux zsh fzf \
ImageMagick xautolock xss-lock \
bat exa fd-find procs ripgrep sd zoxide
```

```bash
cargo install bottom cargo-update du-dust topgrade
```
<!-- cargo install bat bottom du-dust exa procs ripgrep sd topgrade zoxide -->

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
git clone --bare https://github.com/rilstrats/dotfiles.git $XDG_CONFIG_HOME/dotfiles.git

/usr/bin/git --git-dir=$XDG_CONFIG_HOME/dotfiles.git --work-tree=$HOME checkout --force
/usr/bin/git --git-dir=$XDG_CONFIG_HOME/dotfiles.git --work-tree=$HOME submodule update --init --remote

cd $HOME/.config/i3/i3lock-fancy; sudo make install
```

### Permanent Aliases

Note, if you are cloning this repo, you will not need to create these aliases, they are already in `~/.zshrc`.

```bash
echo "dotfiles() {/usr/bin/git --git-dir=$XDG_CONFIG_HOME/.dotfiles.git --work-tree=$HOME $*}
alias dfs=dotfiles" >> $HOME/.zshrc
```

This enables you to use commands such as `dfs status` just like `git status` to manage the dotfiles.

### High DPI

When using a high DPI screen, you will want to run this command.

```bash
ln $XDG_CONFIG_HOME/Xresources/hi-dpi $HOME/.Xresources
```

### Touchpad

Edit `/usr/share/X11/xorg.conf.d/40-libinput.conf` to have these in the touchpad section.

```
        Option "NaturalScrolling" "True"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
        Option "AccelSpeed" "0.5"
```

### Power Button Sleep

Edit `/etc/systemd/logind.conf` to have this line

```
HandlePowerKey=suspend
```

