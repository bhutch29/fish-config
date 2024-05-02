function wol --argument-names target --description "send wol to target from jump box"
    if test -z "$target"
        echo "target parameter required"
        return
    end

    switch $target
        case brads76
            echo "waking brads76"
            ssh root@pve "etherwake -i enp5s0 74:56:3c:fe:fc:ba"
    end
end
