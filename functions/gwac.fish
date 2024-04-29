function gwac --argument-names branchName root --description "Checkout branch, including uncommited changes, in new worktree in workspace root"
    set common (git rev-parse --git-common-dir)

    if test -z "$branchName"
        echo Error: new branch name must be provided
        return
    end

    if test -n "$root"
        git branch $branchName $root
    end

    git worktree add (path dirname "$common")/$branchName

    echo Copying changes in the following files:
    git diff --name-only HEAD

    git diff HEAD > (path dirname "$common")/$branchName/gwac.patch

    pushd (path dirname "$common")/$branchName
    git apply gwac.patch
    popd

    git restore --worktree --staged :/
end
