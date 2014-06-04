#!/bin/bash

set -e

function main() {
    echo "Pushing to github..."
    cd $HOME/.dotfiles
    git push
}

main
