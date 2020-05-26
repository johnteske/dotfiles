# Load
files=(
  aliases.sh
  fzf.sh
  git.sh)

for file in "${files[@]}"; do
  [ -r "$HOME/.dotfiles/$file" ] && . "$HOME/.dotfiles/$file"
done; unset file

[ -r "$HOME/.dotlocals/.bash_local" ] && . "$HOME/.dotlocals/.bash_local"

# Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Custom bin
export PATH=$PATH:~/.dotfiles/bin
