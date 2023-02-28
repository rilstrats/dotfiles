colab-init() {
  # mamba create -n colab \=
  mamba install \
    python=3.10 cudatoolkit cudnn \
    pandas pyspark numpy sklearn-pandas xgboost tensorflow-gpu scikit-learn \
    jupyter_http_over_ws jupyter_core jupyterlab \
    altair seaborn matplotlib
  mamba activate colab
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(rtx where python@mambaforge)/lib/
  mkdir -p $(rtx where python@mambaforge)/etc/conda/activate.d
  echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(rtx where python@mambaforge)/lib/' > \
    $(rtx where python@mambaforge)/etc/conda/activate.d/env_vars.sh
  # pip install --upgrade pip
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-gpu() {colab-gpu-test}
colab-gpu-test() {
  # mamba activate colab
  python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
}

colab() {
  # mamba activate colab
  jupyter notebook \
    --NotebookApp.allow_origin='https://colab.research.google.com' \
    --port=8888 \
    --NotebookApp.port_retries=0 \
    --NotebookApp.open_browser=False
}

colab-enable() {
  # mamba activate colab
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-disable() {
  # mamba activate colab
  jupyter serverextension disable --py jupyter_http_over_ws
}
