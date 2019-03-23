#!/bin/bash

INSTALL_ENV=$1

bak_lns () {
    [ -f "$1" ] && [ ! -L "$1" ] && mv "$1" "$1.bak"
    ln -sf "$2" "$1"
}

bak_lns ~/.bashrc ~/dotfiles/bash/bashrc

for file in ~/dotfiles/bash/*.bash; do
  bak_lns "$HOME/.$(basename "$file" .bash).bash" "$file"
done

bak_lns ~/.tmux.conf ~/dotfiles/tmux/tmux.conf

bak_lns ~/.vimrc ~/dotfiles/vim/vimrc
mkdir -p ~/.vim/colors
bak_lns ~/.vim/colors/jt.vim ~/dotfiles/vim/colors/jt.vim

if [ "$INSTALL_ENV" == "linux" ]; then
    bak_lns ~/.bashrc.linux ~/dotfiles/bash/bashrc.linux
fi

if [ "$INSTALL_ENV" != "osx" ]; then
    source ~/.bashrc
fi

if [ "$INSTALL_ENV" == "osx" ]; then
    bak_lns ~/.bash_profile ~/dotfiles/bash/bash_profile.osx
    source ~/.bash_profile

    # vscodevim.vim
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

    for f in ~/dotfiles/hammerspoon/*.lua; do
        file=${f##*/}
        ln -sf "$f" "$HOME/.hammerspoon/$file"
    done
fi

#if [ ! -f ~/.git-completion.bash ]; then
#    echo -n "Install git completion? [Y/n] "; read answer
#    if [[ $answer != "n" ]] && [[ $answer != "N" ]]; then
#        download_to_file https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/.git-completion.bash && source ~/.git-completion.bash
#    fi
#fi
