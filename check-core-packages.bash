#!/bin/bash

function is_in_path {
  builtin type -P "$1" &> /dev/null
}

function print_is {
  [ "$?" -eq "0" ] && \
    echo "[-] $1" || \
    echo "[X] $1"
}

function report_in_path {
  is_in_path "$1"; print_is "$1"
}

report_in_path fd
report_in_path fzf
report_in_path git
git_c=~/.git-completion.bash; \
  [ -f "$git_c" ]; print_is "$git_c"
report_in_path tmux
report_in_path vim
ale=~/.vim/pack/git-plugins/start/ale; \
  [ -d "$ale" ]; print_is "$ale"
