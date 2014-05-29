function  make_plugin() {
    plugin=$1
    mkdir -p "$plugin/plugin"
    mkdir -p "$plugin/doc"
    touch "$plugin/README.md"
    touch "$plugin/doc/$plugin.txt"
    touch "$plugin/plugin/$plugin.vim"
}

make_plugin $@
