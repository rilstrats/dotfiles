td() {cd $TMUX_DIR}
alias tmuxer=$HOME/.local/bin/tmux-sessionizer
alias tmuxh=tmux-home
tmux-home() {
  if [[ -z $(tmux list-sessions | grep home) ]]; then
    tmux new-session -s home -c $HOME -e TMUX_DIR=$HOME
  else
    tmux attach-session -t home
  fi
}

