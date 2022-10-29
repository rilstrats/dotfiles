#!/bin/zsh

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

