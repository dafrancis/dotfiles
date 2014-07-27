function _get_all_directories() {
    find . -type d
}

function _filter_hidden() {
    grep -v svn
}

function _get_directories() {
    _get_all_directories | _filter_hidden
}

function make_inits() {
    _get_directories | awk '{ print "touch " $0 "/__init__.py" }' | sh
}

function remove_inits() {
    _get_directories | awk '{ print "rm -rf " $0 "/__init__.p* }" }' | sh
}

