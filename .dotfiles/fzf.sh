#!/bin/sh

# exit early if fzf not found
if ! command -v fzf >/dev/null; then return 1; fi

__jt__fzf_default_preview="[ -f '{}' ] && head -60"
export FZF_DEFAULT_OPTS="--no-mouse --color=16 --info=hidden --preview '$__jt__fzf_default_preview {}'"

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git --type file'
fi

f() {
  if [ ! -t 0 ]; then
    cat <<EOF
f: Use of stdin is not supported. Use fzf instead.

   Example: echo 'one\ntwo' | fzf | cat

EOF
    return 1
  fi

  case "$@" in
  c)
    fzff=$(
      sed "s:~:$HOME:g" "$HOME/.dotfiles/bookmarks" |
      fzf \
        --header 'cd' \
        --preview "ls {}"
      )
    cd "$fzff" || return 1
    ;;
  g)
    # exit early if not git repo
    if ! __jt__git-branch-name 1>/dev/null; then return 1; fi

    # display current branch above header
    fzff=$(git branch \
      --format='%(refname:short)' \
      --sort='-HEAD' |
      fzf \
        --header-lines=1 \
        --header 'git checkout' \
        --preview "git show {} | $__jt__fzf_default_preview")
    [ -n "$fzff" ] && git checkout "$fzff"
    ;;
  v)
    fzff=$(fzf --header 'vim')
    [ -f "$fzff" ] && vim "$fzff"
    ;;
  *)
    # handle args/no args
    if [ "$#" -ne 0 ]; then
      fzff=$(fzf --header "$*")
      [ -n "$fzff" ] && "$@" "$fzff"
    else
      fzf
    fi
    ;;
  esac
  unset fzff
}
