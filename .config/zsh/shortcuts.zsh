ZELLIJ_SHORTCUTS=()

# code
if [[ -d $HOME/code ]]; then
  export CODEPATH=$HOME/code # necessary cause used by git-codeclone
  ZELLIJ_SHORTCUTS+=("$(fd -HI '.git$' $CODEPATH | sed 's|/\.git||')")
fi

# cloud
if [[ -d $HOME/cloud ]]; then
  ZELLIJ_SHORTCUTS+=("$HOME/cloud/notes")
  ZELLIJ_SHORTCUTS+=("$(fd -HI . $HOME/cloud/education --exact-depth 3 --type d)")
  ZELLIJ_SHORTCUTS+=("$(fd -HI . $HOME/cloud/tech/cyber --exact-depth 1 --type d)")
fi

export ZELLIJ_SHORTCUTS

