#!/bin/sh

# TODO handle no args (don't show header)
# TODO how to handle (or not) stdin
# TODO standardize preview (as FZF_DEFAULT_PREVIEW?)
# TODO max preview height

if command -v fzf >/dev/null; then

  export FZF_DEFAULT_OPTS='--no-mouse --color 16 --preview "head -40 {}" --info=hidden'

  if command -v fd > /dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git --type file'
  fi

  f() {
    case "$@" in
      g)
        # exit early if not git repo
        if ! __jt__git-branch-name >/dev/null; then return 1; fi

        # display current branch above header
        fzff=$(git branch \
          --format='%(refname:short)' \
          --sort='-HEAD' | \
        fzf \
          --header-lines=1 \
          --header 'git checkout' \
          --preview 'git show {} | head -40')
        [ -n "$fzff" ] && git checkout "$fzff"
        ;;
      v)
        fzff=$(fzf --header 'vim')
        [ -f "$fzff" ] && vim "$fzff"
        ;;
      *)
        fzff=$(fzf --header "$@")
        [ -f "$fzff" ] && "$@" "$fzff"
        ;;
    esac
    unset fzff
  }

fi
