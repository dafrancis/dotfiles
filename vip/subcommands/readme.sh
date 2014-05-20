#!/bin/bash

bundle=$1

BUNDLE_DIR=~/.vim/bundle

function get_readme() {
    less $BUNDLE_DIR/$bundle/README*
}

function main() {
    if [ -z $bundle ]; then
        echo "No bundle entered"
    elif [ -d $BUNDLE_DIR/$bundle ]; then
        get_readme
    else
        echo "No such bundle '$bundle'"
    fi
}

main 
