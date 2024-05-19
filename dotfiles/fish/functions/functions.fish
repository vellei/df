#!/bin/fish

source $HOME/.config/fish/functions/git.fish
source $HOME/.config/fish/functions/python.fish

function ls --wraps="ls" --description="Better ls"
    command exa \
        --color=auto \
        --long \
        --all \
        --header \
        $argv
end

function lt --description="ls tree view"
    command exa \
        --color=auto \
        --tree \
        $argv
end

function up --description="Navigate up multiple directories"
    set -l args $argv
    if test (count $argv) -eq 0
        set args 1
    end

    set -l count ""
    for i in (seq 1 $args)
        set count "../$count"
    end

    cd $count
end

function diff --wraps="diff" --description="Better diff"
    command diff \
        --recursive \
        --unified \
        --color=always \
        $argv | command bat
end

function bat --wraps="bat" --description="Better cat"
    command bat \
        --color always \
        $argv
end

function wbat --description="Display whitespace"
    command bat \
        --color always \
        --show-all \
        $argv
end

function find_preview --description="Find and preview a file"
    # TODO replace with fd
    command find \
        $argv \
        -exec \
        (which bat) \
        {} +
end

function watch_logs --description="Watch logs with syntax highlighting"
    command tail --follow $argv \
        | command bat --paging=never --language log
end

function mbe --description="Launch my build environment"
    if test -z $argv
        set container "idyllic:latest"
    else
        set container $argv
    end
    docker run -it $container
end

function docker-login --description="Login to a running docker container"
    if test -z $argv
        set image "idyllic"
    else
        set image $argv
    end
    set container $(docker ps --filter ancestor=$image --format json | jq -re '.Names')
    docker exec -it $container /bin/bash
end

function extract --description="Extract compressed files"
    if test -z $argv
        echo "Missing arguments"
        exit 1        
    end

    if test ! -f $argv
        echo "File does not exist"
        exit 1
    end

    switch $argv
        case "*.tar.*" "*.tar" "*.tgz"
            tar -xvf $argv
        case *.zip
            bsdtar -xvf $argv
        case *.bz2
            bunzip2 $argv
        case *.rar
            unrar $argv
    end
end

function fzf --wraps="fzf" --description="fzf with highlighting"
	set -Ux FZF_DEFAULT_OPTS "
		--color=fg:#908caa,bg:#191724,hl:#ebbcba
		--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
		--color=border:#403d52,header:#31748f,gutter:#191724
		--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
		--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
	command fzf
end

function ranger-cd --description="cd to directory on ranger close"
    set dir (mktemp -t ranger_cd.XXX)
    ranger --choosedir=$dir
    cd (cat $dir) $argv
    rm $dir
    commandline -f repaint
end
