function gwa --argument-names branchName root --description "Checkout branch in new worktree in workspace root"
    set common (git rev-parse --git-common-dir)

    if test -n "$root"
        git branch $branchName $root
        git worktree add (path dirname "$common")/$branchName
    else if test -n "$branchName"
        git worktree add (path dirname "$common")/$branchName
    else
        set branchName (git branch --all --color=always | sed "s/remotes\///" | fzf --ansi | sed "s/origin\///" | xargs)
        if test -n "$branchName"
            git worktree add (path dirname "$common")/$branchName --guess-remote
        end
    end
end
