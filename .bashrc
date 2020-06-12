export DOTF="$HOME/.dotfiles"
export DOTL="$HOME/.dotlocals"

# source files
while read -r file
  do [ -r "$file" ] && . "$file"
done <<- EOF
  $DOTF/aliases.sh
  $DOTF/fzf.sh
  $DOTF/git.sh
  $DOTL/.bash_local
EOF

# editor
export VISUAL=vim
export EDITOR="$VISUAL"

# add bin to PATH
export PATH=$PATH:"$DOTF/bin"
