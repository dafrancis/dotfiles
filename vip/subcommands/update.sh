#!/bin/bash

bundle=$1

function vim_bundles() {
    ls ~/.vim/bundle/
}

function update_bundle() {
    bundle=$1
    echo
    echo "Updating $bundle..."
    cd ~/.vim/bundle/$bundle
    git pull
    cd ..
}


function update_all_bundles() {
    for bundle in `vim_bundles`; do
        update_bundle $bundle
    done
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
