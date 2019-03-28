#!/bin/bash

# delimiter
__jt_prompt_d=":"

__jt_prompt_filtered_user () {
  local u
  u=$(whoami)
  case $u in
    johnteske) u="" ;;
    *) u="$u$__jt_prompt_d" ;;
  esac
  echo $u
}

__jt_prompt_git_branch () {
  local BRANCH
  BRANCH=$(__jt_git_branch)
  [[ -n $BRANCH ]] && echo "$__jt_prompt_d$BRANCH"
}

PS1="$(__jt_prompt_filtered_user)\W\$(__jt_prompt_git_branch)\$ "
