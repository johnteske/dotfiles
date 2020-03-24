#!/bin/bash

# Manage dotfiles.git
alias dotf='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'

# General
alias ..="cd .."
alias ll="ls -a"

# git
alias g.="cd \$(git rev-parse --show-toplevel)"
alias ga="git add -p"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gc="git checkout"
alias gb="git branch"
alias gp="git-push"
alias gl="git ls-files"

# tmux
alias t="tmux"

# vim
alias v="vim"
