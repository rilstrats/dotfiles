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

# PAGER
set -g PAGER /usr/bin/less

# EDITOR
if test (command -v hx)
    set -g EDITOR (command -v hx)
else if test (command -v lvim)
    set -g EDITOR (command -v lvim)
else if test (command -v vim)
    set -g EDITOR (command -v vim)
else
    set -g EDITOR (command -v vi)
end

# PATH
fish_add_path -P $XDG_BIN_HOME $CARGO_HOME/bin $GOPATH/bin

if status is-interactive

    # open => xdg-open
    abbr -a open xdg-open

    # owd
    function od; cd $OLDPWD; end
    function owd; echo $OLDPWD; end

    # ls => exa
    if test (command -v exa)
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

    # cd => zoxide
    if test (command -v zoxide)
        zoxide init fish | source
        alias cd=z
    end

    # cat => bat
    test (command -v bat) && alias cat=bat

    # grep => rg
    test (command -v rg) && alias grep=rg

    # tmux => zellij
    test (command -v zellij) && alias tmux=zellij

    # rtx
    test (command -v zoxide) && rtx activate fish | source

    # starship
    test (command -v starship) && starship init fish | source

end

