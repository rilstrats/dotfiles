# XDG
export XDG_CONFIG_HOME=$HOME/.config # configuration
export XDG_DATA_HOME=$HOME/.local/share # packages
export XDG_STATE_HOME=$HOME/.local/state # history
export XDG_CACHE_HOME=$HOME/.cache # non-essential files
export XDG_BIN_HOME=$HOME/.local/bin # binaries

# code
export CODEPATH=$HOME/code
export GOPATH=$CODEPATH/go # ln -s $CODEPATH/src $GOPATH/src
export CARGO_HOME=$CODEPATH/cargo
export RUSTUP_HOME=$CODEPATH/rustup
export NVM_DIR=$CODEPATH/nvm
export MAMBA_DIR=$CODEPATH/mamba
export CONDA_DIR=$MAMBA_DIR
export GEM_HOME=$CODEPATH/gem
export VAGRANT_HOME=$CODEPATH/vagrant

# PATH
export PATH=$XDG_BIN_HOME:$CARGO_HOME/bin:$GOPATH/bin:$PATH

# EDITOR
if [[ ! -z $(command -v lvim) ]]; then
  export EDITOR=$HOME/.local/bin/lvim
elif [[ ! -z $(command -v nvim) ]]; then
  export EDITOR=/usr/bin/nvim
elif [[ ! -z $(command -v vim) ]]; then
  export EDITOR=/usr/bin/vim
else
  export EDITOR=/usr/bin/vi
fi

# PAGER
export PAGER=/usr/bin/less

# clean home
export ANDROID_HOME=$XDG_CONFIG_HOME/android
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export JUPYTER_PLATFORM_DIRS="1"
export KDEHOME=$XDG_CONFIG_HOME/kde
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHONHISTFILE=$XDG_STATE_HOME/python3/history
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python3/startup.py
export R_ENVIRON_USER=$XDG_CONFIG_HOME/R/env
export SOLARGRAPH_CACHE=$XDG_CACHE_HOME/solargraph
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# clean code
# export CARGO_HOME=$XDG_DATA_HOME/cargo
# export CONDA_DIR=$XDG_DATA_HOME/conda # edit $XDG_CONFIG_HOME/conda/condarc
# export GEM_HOME=$XDG_DATA_HOME/gem
# export GOBIN=$XDG_DATA_HOME/go/bin
# export GOMODCACHE=$XDG_CACHE_HOME/go/mod
# export GOPATH=$CODEPATH
# export MAMBA_DIR=$CONDA_DIR
# export NVM_DIR=$XDG_DATA_HOME/nvm
# export RUSTUP_HOME=XDG_DATA_HOME/rustup
# export VAGRANT_HOME=$XDG_DATA_HOME/vagrant

