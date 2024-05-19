#!/bin/fish

function update_submodules --description="Recursively updated git submodules"
    git submodule update --init --recursive
end
