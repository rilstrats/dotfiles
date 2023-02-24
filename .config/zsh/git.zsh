# dotfiles
export DOTFILES=$XDG_CONFIG_HOME/dotfiles.git
export DFS_OPTS="--git-dir=$DOTFILES --work-tree=$HOME"
alias dfs=dotfiles
dotfiles() {/usr/bin/git $(echo $DFS_OPTS) $*}

# git
alias g=git
git() {
  if [[ $PWD == $HOME || $PWD =~ $XDG_CONFIG_HOME.* ]]; then
    OPTS=$DFS_OPTS
  fi
  /usr/bin/git $(echo $OPTS) $*
  unset OPTS
}

gs() {g status $*}
gd() {g diff $*}
gm() {g mv $*}
gr() {g restore $*}
gp() {echo "Use gpull/gpl or gpush/gps"}

gf() {g fetch $*}
gpull() {g pull $*}
alias gpl=gpull

ga() {g add $*}
gc() {g commit -m $*}
gpush () {g push $*}
alias gps=gpush

gac() {ga .; gc "$*"}
gacp() {ga .; gc "$*"; gpush}

grv() {g remote -v $*}
gro() {grv | grep origin | head -n 1 | sed "s/^.*\t//g" | sed "s/ (.*$//g"}

grso () {g remote set-url origin $*}
gssh () {
  repo=$(gro | sed "s/^.*\.com[/:]//g" | sed "s/\.git$//g")
  read "input?Is git@github.com:$repo.git correct? [y/N]: "
  update=`echo ${input:0:1} | tr '[:upper:]' '[:lower:]'`

  if [[ ! "$update" == "y" ]]; then
    echo "Origin not updated. Update using: "
    echo "grso git@github.com:USER/REPO.git"
  else
    grso git@github.com:$repo.git
    echo "Origin updated to $(gro)"
  fi
}

