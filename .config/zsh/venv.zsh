#######
# nvm #
#######

nvm-install() {
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  nvm install lts/hydrogen
  nvm alias default lts/hydrogen
}

[[ -z $(command -v nvm) ]] && nvm () {
  # [[ -z $(echo $PATH | grep $NVM_DIR) ]] && nvm-lazy-load
  nvm-lazy-load
  nvm $*
}

npm () {
  [[ -z $(echo $PATH | grep $NVM_DIR) ]] && nvm-lazy-load
  /usr/bin/env npm $*
}

node () {
  [[ -z $(echo $PATH | grep $NVM_DIR) ]] && nvm-lazy-load
  /usr/bin/env node $*
}

ng () {
  [[ -z $(echo $PATH | grep $NVM_DIR) ]] && nvm-lazy-load
  /usr/bin/env ng $*
}

nvm-lazy-load () {
  # export NVM_DIR="$XDG_CONFIG_HOME/nvm" # set in zshenv
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # loads nvm

  # [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # loads nvm autocompletion (bash_completion)
  # [[ ! -z $(command -v ng) ]] && source $(ng completion script) # loads angular autocompletion
}

if [[ $EDITOR == $HOME/.local/bin/lvim ]]; then
  vim() {[[ -z $(echo $PATH | grep $NVM_DIR) ]] && nvm-lazy-load; $EDITOR $*}
  sudovim() {[[ -z $(echo $PATH | grep $NVM_DIR) ]] && nvm-lazy-load; sudo $EDITOR $*}
fi


###############
# mamba/conda #
###############

conda-install () {mamba-install}
mamba-install () {
  wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
  bash Mambaforge-$(uname)-$(uname -m).sh -p $MAMBA_DIR -b
  rm Mambaforge-$(uname)-$(uname -m).sh
  # curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o $HOME/Downloads/miniconda3.sh
  # bash $HOME/Downloads/miniconda3.sh
}

[[ -z $(command -v conda) ]] && conda() {
  # [[ -z $(echo $PATH | grep $CONDA_DIR) ]] && mamba-lazy-load
  conda-lazy-load
  conda $*
}
[[ -z $(command -v mamba) ]] && mamba() {
  # [[ -z $(echo $PATH | grep $MAMBA_DIR) ]] && mamba-lazy-load
  mamba-lazy-load
  mamba $*
}

conda-lazy-load() {mamba-lazy-load}
mamba-lazy-load() {
  __conda_setup=$('$MAMBA_DIR/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)

  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f $MAMBA_DIR/etc/profile.d/conda.sh ]; then
      . $MAMBA_DIR/etc/profile.d/conda.sh
    else
      export PATH=$MAMBA_DIR/bin:$PATH
    fi
  fi

  unset __conda_setup

  if [ -f "$MAMBA_DIR/etc/profile.d/mamba.sh" ]; then
    . "$MAMBA_DIR/etc/profile.d/mamba.sh"
  fi
}

#########
# colab #
#########

# colab-install() {
  # mamba-install
  # colab-init
# }

colab-init() {
  mamba create -n colab -c conda-forge python cudatoolkit cudnn \
    pandas pyspark numpy sklearn-pandas xgboost tensorflow-gpu scikit-learn \
    jupyter_http_over_ws jupyter_core jupyterlab \
    altair seaborn matplotlib
  mamba activate colab
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
  mkdir -p $CONDA_PREFIX/etc/conda/activate.d
  echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
  # pip install --upgrade pip
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-gpu() {colab-gpu-test}
colab-gpu-test() {
  conda activate colab
  python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
}

colab() {
  conda activate colab
  jupyter notebook \
    --NotebookApp.allow_origin='https://colab.research.google.com' \
    --port=8888 \
    --NotebookApp.port_retries=0 \
    --NotebookApp.open_browser=False
}

colab-enable() {
  conda activate colab
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-disable() {
  conda activate colab
  jupyter serverextension disable --py jupyter_http_over_ws
}

