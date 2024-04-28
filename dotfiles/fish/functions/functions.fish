#!/bin/fish

# More verbose ls
function ls --wraps="ls"
    command exa \
        --color=auto \
        --long \
        --all \
        --header \
        $argv
end

# Tree view
function lt
    command exa \
        --color=auto \
        --tree \
        $argv
end

# Better upwards navigation
function up
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

# Better formatted diff
function diff --wraps="diff"
    command diff \
        --recursive \
        --unified \
        --color=always \
        $argv | command bat
end

# Better formatted cat
function bat --wraps="bat"
    command bat \
        --color always \
        $argv
end

# Show all white space too
function wbat
    command bat \
        --color always \
        --show-all \
        $argv
end

# Find and preview matching files with bat
function find_preview
    command find \
        $argv \
        -exec \
        (which bat) \
        {} +
end

# Watch logs with syntax highlighting
function watch_log
    commmand tail \
        --follow \
        $argv | command bat --paging=never --language log
end
