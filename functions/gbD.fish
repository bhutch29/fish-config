function gbD --description "Delete branch with force"
    set branch (git branch --list | fzf | awk '{print $NF}')
    if test -n "$branch"
        git branch -D $branch
    end
end
