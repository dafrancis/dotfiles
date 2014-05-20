#!/bin/bash

bundle=$1

function vim_bundles() {
    ls ~/.vim/bundle/
}

function delete_bundle() {
    bundle=$1
    echo "Removing $bundle..."
    rm -rf ~/.vim/bundle/$bundle
}

function main() {
    if [ -z $bundle ]; then
        echo "No bundle provided"
    elif [ -d ~/.vim/bundle/$bundle ]; then
        delete_bundle $bundle
    else
        echo "Bundle '$bundle' does not exist"
    fi
}

main
