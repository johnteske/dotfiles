# Load
files=(
  aliases.bash
  git_utils.bash
  prompt.bash
  fuzzy.bash
  bash_local)

for file in "${files[@]}"; do
  [ -r "$HOME/.dotfiles/$file" ] && source "$HOME/.dotfiles/$file"
done; unset file

# Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Custom bin
export PATH=$PATH:~/.dotfiles/bin
