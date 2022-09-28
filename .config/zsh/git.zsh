g () {
  if [[ -z $(git status 2> /dev/null) ]]; then
    /bin/git --git-dir=$DOTFILES --work-tree=$HOME $*
  else
    /bin/git $*
  fi
}

gs () {g status}
gd () {g diff}

gm () {g mv $*}

ga () {g add $*}
gc () {g commit -m $1}
gpush () {g push}

gf () {g fetch}
gpull () {g pull}

gac () {ga .; gc $1}
gacp () {ga .; gc $1; gp}

grv () {g remote -v}
grso () {g remote set-url origin $1}

gssh () {
  repo=$(git remote -v | head -n 1 | sed "s/^.*\.com[/:]//g" | sed "s/ (.*$//g" | sed "s/\.git$//g")
  read "?Is git@github.com:$repo.git correct? [Y/n]: " input
  correct=`echo ${input:0:1} | tr '[:upper:]' '[:lower:]'`
  echo

  if [[ "$correct" == "n" ]]; then
    echo "Origin not updated, please update with either command: "
    echo "git remote set-url origin git@github.com:USER/REPO.git"
    echo "grso git@github.com:USER/REPO.git"
    return
  fi

  git remote set-url origin git@github.com:$repo.git
  echo "Origin updated to:"
  git remote -v
}

