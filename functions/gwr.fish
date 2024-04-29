function gwr --description "remove git worktree"
    set name (git worktree list | rg '\[(.+)\]' -or '$1' | fzf)
    if test -n "$name"
        git worktree remove $name 
        and echo removed $name worktree
    end
end
