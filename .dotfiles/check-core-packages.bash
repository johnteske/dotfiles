#!/bin/bash

read -d '' DEPENDENCIES << EOF
git;command
$HOME/.git-completion.bash;file
vim;command
$HOME/.vim/pack/git-plugins/start/ale;dir
tmux;command
fzf;command
fd;command
EOF

while read -r LINE; do
  DEP=$(echo "$LINE" | cut -d';' -f1)
  TYPE=$(echo "$LINE" | cut -d';' -f2)
  OK=1

  case "$TYPE" in
    command)
      command -v "$DEP" &> /dev/null && OK=0
      #"$DEP" --version
      ;;
    file)
      [ -f "$DEP" ] && OK=0
      ;;
    dir)
      [ -d "$DEP" ] && OK=0
      ;;
    *)
      echo "Unsupported TYPE $TYPE"
  esac

  (( $OK )) && REPORT="NO" || REPORT="ok"
  printf "[$REPORT] $DEP\n"
done <<< "$DEPENDENCIES"
