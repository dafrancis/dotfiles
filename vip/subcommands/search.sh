#!/bin/bash

set -e

query=$1

function urlencode() {
    xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g'
}

function search_github() {
    query=`echo "vim $query" | urlencode`
    curl -s "https://api.github.com/search/repositories?q=$query&sort=stars&order=desc"
}

function parse_json() {
    jq '.items[] | "\(.full_name){\(.description)"'
}

function results() {
    search_github | parse_json
}

function format_results() {
    results | sed 's/"//g' | column -t -s '{'
}

function search() {
    query=$1
    if [ -z "`format_results`" ]; then
        echo "Couldn't find any vim bundle with the search '$query'"
    else
        echo "Results for '$query':"
        format_results
    fi
}

function main() {
    if [ -z $query ]; then
        echo "No search term"
    else
        search "$query"
    fi

}

main
