#!/bin/bash

display_filtered_user () {
  local u
  u=$(whoami)
  case $u in
    johnteske) u="" ;;
    *) u="$u:" ;;
  esac
  echo $u
}

get_git_branch () {
  git rev-parse --abbrev-ref HEAD
}

display_git_branch () {
  local BRANCH
  BRANCH=$(get_git_branch)
  [[ -n $BRANCH ]] && echo ":$BRANCH"
}

PS1="$(display_filtered_user)\W\$(display_git_branch)\$ "
