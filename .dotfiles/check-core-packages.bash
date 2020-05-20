#!/bin/bash

while read -r LINE; do
  PROG=$(echo "$LINE" | awk -F';' '{print $1}')
  TYPE=$(echo "$LINE" | awk -F';' '{print $2}')
  case "$TYPE" in
    command)
      report_in_path "$PROG"
      ;;
    file)
      [ -f "$PROG" ]; print_is "$PROG"
      ;;
    dir)
      [ -d "$PROG" ]; print_is "$PROG"
      ;;
    *)
      echo "Unsupported TYPE $TYPE"
  esac
done <<EOF
git;command
$HOME/.git-completion.bash;file
vim;command
$HOME/.vim/pack/git-plugins/start/ale;dir
tmux;command
fzf;command
fd;command
EOF

function is_in_path {
  # POSIX-compatible
  command -v "$1" &> /dev/null
}

function print_is {
  [ "$?" -eq "0" ] && \
    echo "[-] $1" || \
    echo "[X] $1"
}

function report_in_path {
  is_in_path "$1"; print_is "$1"
}
