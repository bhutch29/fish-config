function zts --argument-names worktree
    if test -z "$worktree"
        echo "worktree parameter required"
        return
    end

		zellij action new-tab -n $worktree -c ~/projects/siggen/$worktree -l siggen-worktree.kd
end
