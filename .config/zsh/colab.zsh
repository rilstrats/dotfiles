colab-install () {
  pip install jupyter_http_over_ws
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-enable () {
  jupyter serverextension enable --py jupyter_http_over_ws
}

colab-disable () {
  jupyter serverextension disable --py jupyter_http_over_ws
}

colab-uninstall () {
  jupyter serverextension disable --py jupyter_http_over_ws
  pip uninstall jupyter_http_over_ws
}

colab () {
  jupyter notebook \
    --NotebookApp.allow_origin='https://colab.research.google.com' \
    --port=8888 \
    --NotebookApp.port_retries=0
}
