VCS_REGEX="svn|git"

function is_mac() {
    [ `uname -s` = "Darwin" ]
}

function list_hidden_directories() {
    ls -d -- .*
}

function get_end_boundary() {
    if is_mac; then
        echo "[[:>:]]"
    else
        echo "\>"
    fi
}

function regex() {
    echo "($VCS_REGEX)`get_end_boundary`"
}

function has_vcs_dir() {
    [[ "`list_hidden_directories`" =~ `regex` ]]
}

function is_root() {
    [ "`pwd`" = '/' ]
}

function output_vcs() {
    for dir in `list_hidden_directories`; do
        if [[ $dir =~ `regex` ]]; then
            echo $dir | sed "s/^.//"
        fi
    done
}

function find_vcs_dir() {
    if has_vcs_dir; then
        output_vcs
    elif is_root; then
        return 1
    else
        cd ..
        find_vcs_dir
    fi
}

function main () {
    find_vcs_dir
}

main
