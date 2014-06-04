#!/bin/bash

set -e

function main() {
    echo "Updating dotfiles..."
    cd $HOME/.dotfiles
    git pull
    git submodule init
    git submodule update
    sh vip/vip.sh update
}

main
