#!/bin/sh

export FZF_DEFAULT_OPTS='--no-mouse --color 16'

if command -v fd > /dev/null 2>&1; then
export FZF_DEFAULT_COMMAND='fd --hidden --type file'
fi

preview='head -80'
preview_window='right'

if command -v fzf >/dev/null
then gf () {
    b=$(git branch | cut -c 3- | fzf \
        --header 'git checkout' \
        --preview "git show {} | ${preview}" \
        --preview-window ${preview_window})
    [ -n "$b" ] && git checkout "$b"
}
else gf () {
  echo "'fzf' not installed. Using fallback."
  git branch
}
fi

if command -v fzf >/dev/null
then vf () {
    f=$(fzf \
        --header 'vim' \
        --preview "${preview} {}" \
        --preview-window "${preview_window}")
    [ -f "$f" ] && vim "$f"
}
else vf () {
  echo "'fzf' not installed. Using fallback."
  vim .
}
fi
