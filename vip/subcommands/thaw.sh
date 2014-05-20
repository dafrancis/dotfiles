#!/bin/bash

BUNDLE_PATH=~/.vim/bundle

function import_file() {
    while read p; do
        url=$(echo $p | cut -d' ' -f1)
        name=$(echo $p | cut -d' ' -f2)
        git submodule add $url $BUNDLE_PATH/$name
    done
}

function main() {
    import_file < "$1"
}

main $@
