#!/bin/bash

REPO_PATH=~/.dotfiles
BUNDLE_PATH=vim/bundle

function import_file() {
    while read p; do
        url=$(echo $p | cut -d' ' -f1)
        name=$(echo $p | cut -d' ' -f2)
        cd $REPO_PATH
        git submodule add $url $BUNDLE_PATH/$name
        git add -A
        git commit -m "Install $url bundle as a submodule."
    done
}

function main() {
    import_file < "$1"
}

main $@
