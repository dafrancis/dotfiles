#!/bin/bash

BUNDLE_PATH=~/.vim/bundle

function bundle_list() {
    ls $BUNDLE_PATH
}

function get_repo() {
    bundle=$1
    cd "$BUNDLE_PATH/$bundle"
    git remote show origin |
    grep "Fetch" |
    awk '{ print $3 }' |
    head -1
}

function format_bundle() {
    bundle=$1
    echo "$(get_repo $bundle) $bundle"
}

function main() {
    for bundle in `bundle_list`; do
        format_bundle $bundle
    done
}

main
