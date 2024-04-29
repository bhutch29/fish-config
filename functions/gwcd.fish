function gwcd --description "Change to directory of existing worktree"
    set common (path resolve (git rev-parse --git-common-dir))
    if test -z "$common"
        return
    end

    set siggenRoot (path dirname "$common")

    set name (git worktree list | awk '{print $1 " " $3}' | rg {$siggenRoot}'/(.*)' -or '$1' | fzf | awk '{print $1}')

    if test -n "$name"
        cd $siggenRoot/$name
    end
end
