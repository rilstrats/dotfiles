ZELLIJ_SHORTCUTS=()

# code
if [[ -d $HOME/code ]]; then
  ZELLIJ_SHORTCUTS+=("$(fd -HI '.git$' $HOME/code | sed 's|/\.git||')")
fi

# cloud
if [[ -d $HOME/cloud ]]; then
  ZELLIJ_SHORTCUTS+=("$HOME/cloud/notes")
  ZELLIJ_SHORTCUTS+=("$(fd -HI . $HOME/cloud/education --exact-depth 3 --type d)")
  ZELLIJ_SHORTCUTS+=("$(fd -HI . $HOME/cloud/tech/cyber --exact-depth 1 --type d)")
fi

export ZELLIJ_SHORTCUTS

