function zts --description "open zellij tab to worktree layout"
    if test -z "$ZELLIJ"
        echo "zts is only valid inside a zellij session"
        return 1
    end

    pushd ~/projects/siggen
    set common (path resolve (git rev-parse --git-common-dir))
    if test -z "$common"
        popd
        return 1
    end

    set siggenRoot (path dirname "$common")
    set name (git worktree list | awk '{print $1 " " $3}' | rg {$siggenRoot}'/(.*)' -or '$1' | fzf | awk '{print $1}')
    if test -z "$name"
        popd
        return 1
    end

    zellij action new-tab -n $name -c ./$name -l siggen-worktree
end
