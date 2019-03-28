#!/bin/bash

__jt_display_filtered_user () {
  local u
  u=$(whoami)
  case $u in
    johnteske) u="" ;;
    *) u="$u:" ;;
  esac
  echo $u
}

__jt_display_git_branch () {
  local BRANCH
  BRANCH=$(__jt_git_branch)
  [[ -n $BRANCH ]] && echo ":$BRANCH"
}

PS1="$(__jt_display_filtered_user)\W\$(__jt_display_git_branch)\$ "
