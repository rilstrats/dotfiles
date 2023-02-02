# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# ZDOTDIR
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Coding
export CODEPATH=$HOME/code
export GOPATH=$CODEPATH/go # ln -s $CODEPATH/src $GOPATH/src
export CARGO_HOME=$CODEPATH/cargo
export RUSTUP_HOME=$CODEPATH/rustup
export NVM_DIR=$CODEPATH/nvm
export MAMBA_DIR=$CODEPATH/mamba
export CONDA_DIR=$MAMBA_DIR
# export GEM_HOME=$HOME/code/gems
# export GEM_PATH=$XDG_CONFIG_HOME/gems

# PATH
export PATH=$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$PATH

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

