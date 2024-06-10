ZELLIJ_SHORTCUTS=()

# code
if [[ -d $HOME/code ]]; then
  ZELLIJ_SHORTCUTS+=($(fd -HI '.git$' $HOME/code | sed 's|/\.git||'))
fi

# cloud
if [[ -d $HOME/cloud ]]; then
  ZELLIJ_SHORTCUTS+=($HOME/cloud/notes)

  CLOUDEDU=$CLOUDPATH/education
  ZELLIJ_SHORTCUTS+=($(fd -HI . $CLOUDEDU --exact-depth 3 --type d))

  CLOUDCYBER=$CLOUDPATH/tech/cyber
  ZELLIJ_SHORTCUTS+=($(fd -HI . $CLOUDCYBER --exact-depth 1 --type d))
fi

export ZELLIJ_SHORTCUTS

