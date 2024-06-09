#!/bin/fish

function block_site --description "Block website temporarily"
    if test -z "$1"
        return 1
    end
    iptables -w -I OUTPUT -d "$1" -j DROP 2>&1
end

function allow_site --description "Delete drop rules to allow website"
    if test -z "$1"
        return 1
    end

    set -l rule $(iptables -w -S OUTPUT | grep "$1" | sed 's/-A/-D/')
    iptables -w "$rule"
end

function pomodoro

    # TODO: Arg parsing

end
