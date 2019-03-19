#!/bin/bash

export FZF_DEFAULT_OPTS='--no-mouse'

preview='head -80'
preview_window='--preview-window right'

gcf () {
  git checkout "$(git branch | cut -c 3- | fzf --header 'git checkout' --preview "git show {} | ${preview}" ${preview_window})"
}

vf () {
  vim "$(fzf --header 'vim' --preview "${preview} {}" ${preview_window})"
}
