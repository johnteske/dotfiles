#!/bin/bash

export FZF_DEFAULT_OPTS='--no-mouse'

gcf () {
    git checkout "$(git branch | cut -c 3- | fzf)"
}

vf () {
   vim "$(fzf)"
}
