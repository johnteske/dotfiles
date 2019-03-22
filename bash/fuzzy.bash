#!/bin/bash

export FZF_DEFAULT_OPTS='--no-mouse'

preview='head -80'
preview_window='--preview-window right'

gf () {
  local b
  b=$(git branch | cut -c 3- | fzf --header 'git checkout' --preview "git show {} | ${preview}" ${preview_window})
  [ -n "$b" ] && git checkout "$b"
}

vf () {
  local f=$(fzf --header 'vim' --preview "${preview} {}" ${preview_window})
  [ -f "$f" ] && vim "$f"
}
