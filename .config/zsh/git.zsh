# dotfiles
export DOTFILES=$XDG_CONFIG_HOME/dotfiles.git
# export DFS_OPTS="--git-dir=$DOTFILES --work-tree=$HOME"
# alias dfs=dotfiles
# dotfiles() {/usr/bin/git $(echo $DFS_OPTS) $*}

# git
alias g=git
git() {
  if [[ $PWD == $HOME || $PWD =~ $XDG_CONFIG_HOME.* ]]; then
    OPTS="--git-dir=$DOTFILES --work-tree=$HOME"
  fi
  /usr/bin/git $(echo $OPTS) $*
  unset OPTS
}

gs() {git status $*}
gd() {git diff $*}
gm() {git mv $*}
gr() {git restore $*}
greset() {git reset $*}

gf() {git fetch $*}
gpull() {git pull $*}

ga() {git add $*}
gc() {git commit $*}
gca() {git commit --amend $*}
gcm() {git commit -m $*}
gpush() {git push $*}

gac() {ga .; gc}
gacm() {ga .; gcm $*}
gacmp() {ga .; gcm $1; gpush}
gacp() {ga .; gc; gpush}
gcp() {gc; gpush}

grv() {g remote -v}
grvo() {
  grv | grep origin | head -n 1 | sed 's/^.*\t//g' | sed 's/ (.*$//g'
}

grso () {g remote set-url origin $*}
gssh () {
  repo=$(grvo | sed 's/^.*\.com[/:]//g' | sed 's/\.git$//g')
  read "input?Is git@github.com:$repo.git correct? [y/N]: "
  update=$(echo ${input:0:1} | tr '[:upper:]' '[:lower:]')

  if [[ ! "$update" == "y" ]]; then
    echo "Origin not updated. Update using: "
    echo "grso git@github.com:USER/REPO.git"
  else
    grso git@github.com:$repo.git
    echo "Origin updated to $(grvo)"
  fi
}

