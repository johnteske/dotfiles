#!/bin/bash

function is_in_path {
  builtin type -P "$1" &> /dev/null
}

function print_is {
  [ "$?" -eq "0" ] && \
    echo "$1 OK" || \
    echo "$1 Not installed"
}

function report_in_path {
  is_in_path "$1"; print_is "$1"
}

function report_is {
  [ -f "$1" ]; print_is "$1"
}

report_in_path fd
report_in_path fzf
report_in_path git
report_is ~/.git-completion.bash
report_in_path tmux
report_in_path vim
report_is ~/.vim/pack/git-plugins/start/ale
