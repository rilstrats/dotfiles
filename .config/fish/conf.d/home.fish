set -g ANDROID_HOME $XDG_CONFIG_HOME/android
set -g CUDA_CACHE_PATH $XDG_CACHE_HOME/nv
set -g DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -g GEM_HOME $XDG_DATA_HOME/gem
set -g GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -g JUPYTER_PLATFORM_DIRS "1"
set -g KDEHOME $XDG_CONFIG_HOME/kde
set -g NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -g PYTHONHISTFILE $XDG_STATE_HOME/python3/history
set -g PYTHONSTARTUP $XDG_CONFIG_HOME/python3/startup.py
set -g R_ENVIRON_USER $XDG_CONFIG_HOME/R/env
set -g SOLARGRAPH_CACHE $XDG_CACHE_HOME/solargraph
set -g VAGRANT_HOME $XDG_DATA_HOME/vagrant
set -g WGETRC $XDG_CONFIG_HOME/wgetrc
set -g ZDOTDIR $XDG_CONFIG_HOME/zsh

set -g GVIMINIT='let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" : "$XDG_CONFIG_HOME/nvim/init.gvim" | source $MYGVIMRC'
set -g VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | source $MYVIMRC'

alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
# alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
