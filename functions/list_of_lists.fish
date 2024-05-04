function list_of_lists --description "Open FZF list of FZF lists"
    set lists "git branches" "git worktrees" "zellij sessions" "docker images" "docker containers"
    set selected_list (printf "%s\n" $lists | fzf)
    if test -z "$selected_list"
        return
    end

    switch "$selected_list"
        case "git branches"
            set result (git branch --list --color=always | fzf --ansi | awk '{print $NF}') 
        case "git worktrees"
            set result (git worktree list | rg '\[(.+)\]' -or '$1' | fzf)
        case "zellij sessions"
            set result (zellij ls | awk '{print $1}' | fzf) 
        case "docker images"
            # TODO: parse what to print as result
            set result (docker image list --format '{{.Repository}} {{.Tag}}' | fzf)
        case "docker containers"
            # TODO: parse what to print as result
            set result (docker ps -a --format '{{.Names}} {{.Image}}' | fzf)
    end

    if test -n "$result"
        commandline --current-token --replace -- $result
    end
    commandline --function repaint
end
