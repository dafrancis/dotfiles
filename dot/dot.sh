#!/bin/bash

command=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function main() {
    subcommand_script="$DIR/subcommands/$command.sh"
    if [ -z $command ]; then
        echo "dot: dotfiles manager"
    elif [ -f $subcommand_script ]; then
        shift
        bash $subcommand_script $@
    else
        echo "dot: Unrecognised command"
    fi
}

main $@
