#!/bin/bash

# General
alias ..="cd .."
alias ll="ls -a"
function cl() {
  cd "$1" && ll
}

# git
alias g.="cd \$(git rev-parse --show-toplevel)"
alias ga="git add -p"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gc="git checkout"
alias gb="git branch"

# tmux
alias t="tmux"

# vim
alias v="vim"
