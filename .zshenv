export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export PATH="$HOME/.local/bin:$PATH"

if [[ ! -z $(command -v lvim) ]]; then
  export EDITOR="$HOME/.local/bin/lvim"
elif [[ ! -z $(command -v nvim) ]]; then
  export EDITOR="/usr/bin/nvim"
elif [[ ! -z $(command -v vim) ]]; then
  export EDITOR="/usr/bin/vim"
else
  export EDITOR="/usr/bin/vi"
fi

export PAGER="/usr/bin/less"

