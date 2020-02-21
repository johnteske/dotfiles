# Load
files=(
  aliases.bash
  git_utils.bash
  prompt.bash
  fuzzy.bash)

for file in "${files[@]}"; do
  [ -r "$HOME/.dotfiles/$file" ] && . "$HOME/.dotfiles/$file"
done; unset file

[ -r "$HOME/.bash_local" ] && . "$HOME/.bash_local"

# Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Custom bin
export PATH=$PATH:~/.dotfiles/bin
