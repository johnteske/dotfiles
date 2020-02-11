#!/bin/bash

INSTALL_ENV=$1

bak_lns () {
    [ -f "$1" ] && [ ! -L "$1" ] && mv "$1" "$1.bak"
    ln -sf "$2" "$1"
}

bak_lns ~/.bashrc ~/dotfiles/bash/bashrc

for file in "$HOME"/dotfiles/bash/*.bash; do
  bak_lns "$HOME/.$(basename "$file" .bash).bash" "$file"
done

bak_lns ~/.tmux.conf ~/dotfiles/tmux/tmux.conf

bak_lns ~/.vimrc ~/dotfiles/vim/vimrc
mkdir -p ~/.vim/colors
bak_lns ~/.vim/colors/jt.vim ~/dotfiles/vim/colors/jt.vim

bak_lns ~/.zshrc ~/dotfiles/zsh/zshrc.zsh
