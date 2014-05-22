#! /bin/bash

# Fancylog for svn

ANSI_BLACK='\033[30m'
ANSI_BLACK_BOLD='\033[0;30;1m'
ANSI_RED='\033[31m'
ANSI_RED_BOLD='\033[0;31;1m'
ANSI_GREEN='\033[32m'
ANSI_GREEN_BOLD='\033[0;32;1m'
ANSI_YELLOW='\033[33m'
ANSI_YELLOW_BOLD='\033[0;33;1m'
ANSI_BLUE='\033[34m'
ANSI_BLUE_BOLD='\033[0;34;1m'
ANSI_MAGENTA='\033[35m'
ANSI_MAGENTA_BOLD='\033[0;35;1m'
ANSI_CYAN='\033[36m'
ANSI_CYAN_BOLD='\033[0;36;1m'
ANSI_WHITE='\033[37m'
ANSI_WHITE_BOLD='\033[0;37;1m'
ANSI_RESET='\033[0m'

awk_script='{\
    gsub("^ *| *$", "", $2);\
    gsub(/\+.*/, "", $3);\
    sub(/^.*?lines?/, "", $4);\
    if ($1 ~ /^ r/)\
    print "'$ANSI_YELLOW'" $1 "{'$ANSI_RED_BOLD'(" $2 "){'$ANSI_RESET$ANSI_CYAN'" $3 "{'$ANSI_RESET$ANSI_GREEN'" $4\
}'

svn log $* | perl -l40pe 's/^-+/\n/' | awk -F '|' "$awk_script" | column -ts "{" | less -FXRSE
