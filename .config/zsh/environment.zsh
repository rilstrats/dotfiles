#######
# nvm #
#######

if [[ -z $(command -v nvm) ]]; then
  nvm () {
    [[ -z $(echo $NVM_DIR) ]] && nvm-setup
    nvm $*
    # node-path
  }
fi

npm () {
  [[ -z $(echo $NVM_DIR) ]] && nvm-setup
  # $NODE_PATH/npm $*
  npm $*
}

node () {
  [[ -z $(echo $NVM_DIR) ]] && nvm-setup
  # $NODE_PATH/node $*
  node $*
}

ng () {
  [[ -z $(echo $NVM_DIR) ]] && nvm-setup
  # $NODE_PATH/ng $*
  ng $*
}

nvm-setup () {
  export NVM_DIR="$XDG_CONFIG_HOME/nvm"
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # loads nvm

  # [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # loads nvm autocompletion (bash_completion)
  # [[ ! -z $(command -v ng) ]] && source $(ng completion script) # loads angular autocompletion
  
  nvm use default
  # node-path
}

node-path () {
  export NODE_PATH=$(echo $PATH | tr ':' '\n' | grep nvm)
}


#########
# conda #
#########

if [[ -z $(command -v conda) ]]; then
  conda () {
    [[ -z $(echo $PATH | grep conda) ]] && conda-setup
    conda $*
  }
fi

conda-setup () {
    __conda_setup=$("$HOME/.config/miniconda3/bin/conda" "shell.zsh" "hook" 2> /dev/null)
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/.config/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/.config/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/.config/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}


#########
# colab #
#########

colab-conda-install () {
  curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o $HOME/Downloads/miniconda3.sh
  bash $HOME/Downloads/miniconda3.sh
}

colab-setup () {
  conda create --name colab python=3.9 
  conda activate colab
  conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
  mkdir -p $CONDA_PREFIX/etc/conda/activate.d
  echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
  pip install --upgrade pip
  pip install pandas numpy altair seaborn matplotlib sklearn xgboost tensorflow jupyter_http_over_ws
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-test-gpu () {
  conda activate colab
  python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
}

colab-enable () {
  conda activate colab
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-disable () {
  conda activate colab
  jupyter serverextension disable --py jupyter_http_over_ws
}

colab () {
  conda activate colab
  jupyter notebook \
    --NotebookApp.allow_origin='https://colab.research.google.com' \
    --port=8888 \
    --NotebookApp.port_retries=0 \
    --NotebookApp.open_browser=False
}

