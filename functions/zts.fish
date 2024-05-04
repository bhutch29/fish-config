function zts --description "open zellij tab to worktree layout"
		cd ~/projects/siggen
    set common (path resolve (git rev-parse --git-common-dir))
    if test -z "$common"
        return
    end

    set siggenRoot (path dirname "$common")
    set name (git worktree list | awk '{print $1 " " $3}' | rg {$siggenRoot}'/(.*)' -or '$1' | fzf | awk '{print $1}')

		zellij action new-tab -n $name -c ./$name -l siggen-worktree
end
