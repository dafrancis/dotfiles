#!/bin/bash

set -e

function main() {
    echo "Updating dotfiles..."
    cd $HOME/.dotfiles
    git pull
    git submodule update --init
    sh vip/vip.sh update
}

main
