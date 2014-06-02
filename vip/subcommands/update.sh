#!/bin/bash

bundle=$1

function update_bundle() {
    bundle=$1
    echo
    echo "Updating $bundle..."
    git submodule update "$HOME/.vim/bundle/$bundle"
}


function update_all_bundles() {
    git submodule foreach git pull origin master
}

function main() {
    if [ -z $bundle ]; then
        update_all_bundles
    elif [ -d ~/.vim/bundle/$bundle ]; then
        update_bundle $bundle
    else
        echo "Package '$bundle' does not exist"
    fi
}

main
