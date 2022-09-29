#!/bin/zsh

g () {
  if [[ -z $(git status 2> /dev/null) ]]; then
    /bin/git --git-dir=$DOTFILES --work-tree=$HOME $*
  else
    /bin/git $*
  fi
}

gs () {grvo; echo; g status}
gd () {grvo; g diff}
gm () {g mv $*}

ga () {g add $*}
gc () {g commit -m $1}
gpush () {g push}

gf () {grvo; echo; g fetch}
gpull () {grvo; echo; g pull}

gac () {ga .; gc $1}
gacp () {ga .; gc $1; gpush}

grv () {g remote -v}
grvo () {grv | grep origin | head -n 1 | sed "s/^.*\t//g" | sed "s/ (.*$//g"}

grso () {g remote set-url origin $1}

gssh () {
  repo=$(grvo | sed "s/^.*\.com[/:]//g" | sed "s/\.git$//g")
  read "?Is git@github.com:$repo.git correct? [Y/n]: " input
  correct=`echo ${input:0:1} | tr '[:upper:]' '[:lower:]'`
  echo

  if [[ "$correct" == "n" ]]; then
    echo "Origin not updated, please update with this command: "
    echo "grso git@github.com:USER/REPO.git"
  else
    grso git@github.com:$repo.git
    echo "Origin updated to:"
    git remote -v
  fi
}

