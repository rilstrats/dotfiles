#!/bin/zsh

conda () {
    [[ -z $(echo $PATH | grep conda) ]] && conda-setup
    $XDG_CONFIG_HOME/miniconda3/bin/conda $*
}

conda-setup () {
    __conda_setup="$('/home/rilstrats/.config/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/rilstrats/.config/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/rilstrats/.config/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/rilstrats/.config/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

