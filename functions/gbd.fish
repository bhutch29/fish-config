function gbd --description "Delete branch"
    set branch (git branch --list | fzf | awk '{print $NF}')
    if test -n "$branch"
        git branch -d $branch
    end
end
