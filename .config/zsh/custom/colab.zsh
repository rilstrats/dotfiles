#!/bin/zsh

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
  pip install tensorflow jupyter_http_over_ws
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
    --NotebookApp.port_retries=0
}
