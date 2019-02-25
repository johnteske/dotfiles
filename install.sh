#!/bin/bash
#
# install.sh

INSTALL_ENV=$1

bak_lns () {
    [ -f "$1" ] && [ ! -L "$1" ] && mv "$1" "$1.bak"
    ln -sf "$2" "$1"
}

bak_lns ~/.bashrc ~/dotfiles/bash/bashrc
bak_lns ~/.aliases ~/dotfiles/bash/aliases
bak_lns ~/.prompt ~/dotfiles/bash/prompt
bak_lns ~/.git_utils ~/dotfiles/bash/git_utils

bak_lns ~/.tmux.conf ~/dotfiles/tmux/tmux.conf
bak_lns ~/.vimrc ~/dotfiles/vim/vimrc

if [ "$INSTALL_ENV" == "linux" ]; then
    bak_lns ~/.bashrc.linux ~/dotfiles/bash/bashrc.linux
fi

if [ "$INSTALL_ENV" != "osx" ]; then
    source ~/.bashrc
fi

if [ "$INSTALL_ENV" == "osx" ]; then
    bak_lns ~/.bash_profile ~/dotfiles/bash/bash_profile.osx
    source ~/.bash_profile

    # iTerm2
    # defaults delete com.googlecode.iterm2
    ln -sf ~/dotfiles/iTerm2/DynamicProfiles/johnteske.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/johnteske.json

    # vscodevim.vim
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

    for f in ~/dotfiles/hammerspoon/*.lua; do
        file=${f##*/}
        ln -sf $f ~/.hammerspoon/$file
    done
fi

#if [ ! -f ~/.git-completion.bash ]; then
#    echo -n "Install git completion? [Y/n] "; read answer
#    if [[ $answer != "n" ]] && [[ $answer != "N" ]]; then
#        download_to_file https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/.git-completion.bash && source ~/.git-completion.bash
#    fi
#fi
