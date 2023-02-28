# XDG
export XDG_CONFIG_HOME=$HOME/.config # configuration
export XDG_DATA_HOME=$HOME/.local/share # packages
export XDG_STATE_HOME=$HOME/.local/state # history
export XDG_CACHE_HOME=$HOME/.cache # non-essential files
export XDG_BIN_HOME=$HOME/.local/bin # binaries

# code
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export RUSTC_WRAPPER=$CARGO_HOME/bin/sccache
export GOPATH=$XDG_DATA_HOME/go

# PATH
export PATH=$XDG_BIN_HOME:$CARGO_HOME/bin:$GOPATH/bin:$PATH

# EDITOR
if [[ -x $(command -v lvim) ]]; then
  export EDITOR=$(command -v lvim)
elif [[ -x $(command -v nvim) ]]; then
  export EDITOR=$(command -v nvim)
elif [[ -x $(command -v vim) ]]; then
  export EDITOR=$(command -v vim)
else
  export EDITOR=$(command -v vi)
fi

# PAGER
export PAGER=/usr/bin/less

# XDG compliance
export ANDROID_HOME=$XDG_CONFIG_HOME/android
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export GEM_HOME=$XDG_DATA_HOME/gem
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export JUPYTER_PLATFORM_DIRS="1"
export KDEHOME=$XDG_CONFIG_HOME/kde
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHONHISTFILE=$XDG_STATE_HOME/python3/history
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python3/startup.py
export R_ENVIRON_USER=$XDG_CONFIG_HOME/R/env
export SOLARGRAPH_CACHE=$XDG_CACHE_HOME/solargraph
export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

