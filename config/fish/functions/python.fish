#!/bin/fish

function create-venv --description="Create virtual environment in CWD"
    if ! command -v python3 >/dev/null
        echo "Missing python3"
        exit 1
    end

    if test ! -f .gitignore
        echo "Creating .gitignore"
        touch .gitignore
    end

    if test ! grep "venv" .gitignore
        echo "venv" >>.gitignore
    end

    if ! command -v virtualenv >/dev/null
        echo "Install virtualenv for python3"
        exit 1
    end

    python3 -m venv venv
end

function start-venv --description="Start virtual environment in CWD"
    if ! test -d ./venv
        echo "Creating virtual environment"
        create-venv
    end
    source ./venv/bin/activate
end
