# dotfiles

This repo is used to store my personal dotfiles. Enjoy!

## Submodules

By cloning these dotfiles and setting up the submodules, you are also installing:

- https://github.com/zdharma-continuum/fast-syntax-highlighting
- https://github.com/zsh-users/zsh-autosuggestions
- https://github.com/jeffreytse/zsh-vi-mode
- https://github.com/rilstrats/kickstart.nvim

## Dependencies

### Fedora

#### CLI Apps

```bash
sudo dnf install @development-tools \
bat fd-find fzf neovim ripgrep stow zsh
bat cache --build
```

#### GUI Apps

```bash
sudo dnf install alacritty nextcloud-client steam
flatpak remote-add --if-not-exists flathub \
https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install brave discord obsidian
```


<!-- #### i3 -->
<!---->
<!-- ```bash -->
<!-- sudo dnf install dunst i3 rofi feh \ -->
<!-- brightnessctl polybar wmctrl xset \ -->
<!-- ImageMagick xautolock xss-lock  -->
<!-- ``` -->

### Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs |\
sh -s -- --no-modify-path -y
cargo install cargo-binstall
cargo binstall cargo-quickinstall
cargo binstall bacon cargo-update eza topgrade mise zellij starship
```
<!-- cargo install bacon bat bottom du-dust exa procs ripgrep sd topgrade zoxide -->


## Install

I've recently migrated to stow, check out the new commands.
Run the following commands to clone this repo, checkout this files, and install the submodules.

```bash
git clone https://github.com/rilstrats/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
git submodule update --init --checkout
stow .
```

If you see any errors from the stow command, you will need to delete the conflicting files.

### Secrets Management

You will need to set up your secrets using `secret-tool`.
This is currently only needed for WakaTime.
Run the command below.
You will then be prompted for a "password."
The "password" you input should be your API key.

```sh
secret-tool store --label="WakaTime API Key" wakatime api_key
```
### Mise

When installing python, it often spouts warnings/errors.This command fixed these errors:

```sh
sudo dnf install libffi-devel sqlite-devel readline-devel bzip2-devel tk-devel
```

### Disks

In `/etc/fstab`:

```
UUID=1d13b649-09b5-4760-a335-84325fc5ee23 /mnt/gaming   btrfs subvol=gaming,defaults,compress=zstd,noatime,autodefrag 0 0
UUID=1d13b649-09b5-4760-a335-84325fc5ee23 /mnt/backitup btrfs subvol=backitup,defaults,compress=zstd,noatime,autodefrag 0 0
```

The mountpoints must be created and permissions changed:

```sh
sudo mkdir /gaming /backitup
sudo chmod 1777 /gaming /backitup
```

### Mailto Links

If you want to use a browser to open mailto links, you must set the permissions in the specific browser, then use this command:

```
xdg-mime default com.google.Chrome.desktop x-scheme-handler/mailto
```
