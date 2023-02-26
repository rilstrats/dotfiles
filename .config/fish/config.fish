# XDG
set -g XDG_CONFIG_HOME $HOME/.config # configuration
set -g XDG_DATA_HOME $HOME/.local/share # packages
set -g XDG_STATE_HOME $HOME/.local/state # history
set -g XDG_CACHE_HOME $HOME/.cache # non-essential files
set -g XDG_BIN_HOME $HOME/.local/bin # binaries

# code
set -g CARGO_HOME $XDG_DATA_HOME/cargo
set -g RUSTUP_HOME $XDG_DATA_HOME/rustup
set -g RUSTC_WRAPPER $CARGO_HOME/bin/sccache
set -g GOPATH $XDG_DATA_HOME/go

# PATH
fish_add_path -P $XDG_BIN_HOME $CARGO_HOME/bin $GOPATH/bin $PATH

if status is-interactive

    # ls
    if test -x (command -v exa)
        alias l='exa --git -la'
        alias ls='exa --git'
        alias la='exa --git -a'
        alias ll='exa --git -l'
        alias l.='exa --git -lad .*'
    else
        alias l='ls --color=auto -ohA'
        alias ls='ls --color=auto'
        alias la='ls --color=auto -A'
        alias ll='ls --color=auto -oh'
        alias l.='ls --color=auto -ohAd .*'
    end

    # version manager
    rtx activate fish | source

    # theme
    starship init fish | source

end

