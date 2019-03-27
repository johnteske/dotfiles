#!/bin/bash

export FZF_DEFAULT_OPTS='--no-mouse'

if builtin type -P fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

preview='head -80'
preview_window='right'

gf () {
  local b
  b=$(git branch | cut -c 3- | fzf \
    --header 'git checkout' \
    --preview "git show {} | ${preview}" \
    --preview-window ${preview_window})
  [ -n "$b" ] && git checkout "$b"
}

vf () {
  local f
  f=$(fzf \
    --header 'vim' \
    --preview "${preview} {}" \
    --preview-window "${preview_window}")
  [ -f "$f" ] && vim "$f"
}
