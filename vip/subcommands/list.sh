#!/bin/bash

function main() {
    echo "The list of plugins are:"
    ls ~/.vim/bundle/ | awk '{ print "  " $0 }'
}

main
