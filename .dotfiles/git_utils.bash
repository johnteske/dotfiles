#!/bin/bash

# Git completion
if [ "$SHELL" = "/bin/bash" ]; then
  [ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
fi

git config --global alias.a 'add -p'
git config --global alias.b branch
git config --global alias.c checkout
git config --global alias.d diff
git config --global alias.ds 'diff --staged'
git config --global alias.l ls-files
git config --global alias.s status
