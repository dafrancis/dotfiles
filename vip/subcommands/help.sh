#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

subcommand=$1

function list_available_commands() {
    echo "The following commands are available:"
    ls $DIR | awk -F "." '{ print "  " $1 }'
}

function main() {
    if [ -z $subcommand ]; then
        list_available_commands
    elif [ -f $DIR/$subcommand.sh ]; then
        echo "show help hgere"
    else
        echo "No such subcommand '$subcommand'"
    fi
}

main
