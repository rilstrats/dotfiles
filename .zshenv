# XDG
export XDG_CONFIG_HOME=$HOME/.config # configuration
export XDG_DATA_HOME=$HOME/.local/share # packages
export XDG_STATE_HOME=$HOME/.local/state # history
export XDG_CACHE_HOME=$HOME/.cache # non-essential files

# code
export CODEPATH=$HOME/code
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export GOPATH=$XDG_DATA_HOME/go
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# PATH
export PATH=$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$PATH

# EDITOR
if command -v nvim &> /dev/null; then
  export EDITOR=nvim
elif command -v vim &> /dev/null; then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=$EDITOR

# PAGER
export PAGER=less

# XDG compliance
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export GEM_HOME=$XDG_DATA_HOME/gem
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
export JUPYTER_PLATFORM_DIRS=1
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
export VAGRANT_ALIAS_FILE=$XDG_DATA_HOME/vagrant/aliases
export WAKATIME_HOME=$XDG_CONFIG_HOME/wakatime

