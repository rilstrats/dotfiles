# dotfiles

This repo is used to store my personal dotfiles. Enjoy!

## Submodules

By cloning these dotfiles and setting up the submodules, you are also installing:

- https://github.com/zsh-users/zsh-syntax-highlighting/tree/master
- https://github.com/zsh-users/zsh-autosuggestions/tree/master
- https://github.com/jeffreytse/zsh-vi-mode/tree/master
- https://github.com/rilstrats/kickstart.nvim

## Dependencies

### Fedora

```bash
sudo dnf install @development-tools nextcloud-client \
alacritty neovim zsh fzf \
bat-cat exa fd-find ripgrep zoxide
```

#### i3

```bash
sudo dnf install dunst i3 rofi feh \
brightnessctl polybar wmctrl xset \
ImageMagick xautolock xss-lock 
```

### Rust

```bash
cargo install cargo-binstall cargo-update cargo-quickinstall
cargo binstall bacon topgrade rtx-cli zellij starship nu
```
<!-- cargo install bacon bat bottom du-dust exa procs ripgrep sd topgrade zoxide -->


## Install

Run the following commands to bare clone this repo, checkout this files, and install the submodules.

```bash
git clone --bare https://github.com/rilstrats/dotfiles.git $HOME/.config/dotfiles.git
git --git-dir=$HOME/.config/dotfiles.git --work-tree=$HOME checkout --force --recurse-submodules 
```
### i3

```
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

