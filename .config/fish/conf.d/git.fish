# dotfiles
set -g DOTFILES $XDG_CONFIG_HOME/dotfiles.git
abbr -a dotfiles git --git-dir=$DOTFILES --work-tree=$HOME
abbr -a dfs git --git-dir=$DOTFILES --work-tree=$HOME

# TODO
# implement git function that switches between dfs and git

abbr -a g git

abbr -a gs git status
abbr -a gd git diff
abbr -a gm git mv
abbr -a gr git restore

abbr -a gf fit fetch
abbr -a gpull git pull

abbr -a ga git add
abbr -a gc git commit
abbr -a gcm git commit -m
abbr -a gpush git push

abbr -a gac 'git add . && git commit'
abbr -a gacp 'git add . && git commit && git push' 
abbr -a gcp 'git commit && git push' 

abbr -a grv git remote -v
function grvo
    git remote -v | grep origin | head -n 1 | sed 's/^.*\t//g' | sed 's/ (.*$//g'
end

abbr -a grso git remote set-url origin
function gssh
    set -f repo (grvo | sed 's/^.*\.com[/:]//g' | sed 's/\.git$//g')
    read input -P "Is git@github.com:$repo.git correct? [y/N]: "
    set -f update (string split -l 1 | string lower)

    if [[ ! "$update" == "y" ]]; then
        echo "Origin not updated. Update using: "
        echo "grso git@github.com:USER/REPO.git"
    else
        git remote set-url origin git@github.com:$repo.git
        echo "Origin updated to $(grvo)"
    end
end
