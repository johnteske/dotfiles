#!/bin/bash

INSTALL_ENV=$1

backup_config () {
    [ -f "$1" ] && mv "$1" "$1.bak"
}

backup_config ~/.bashrc
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc

if [ "$INSTALL_ENV" == "linux" ]; then
    ln -s ~/dotfiles/bash/bashrc.linux ~/.bashrc.linux

    source ~/.bashrc
fi

if [ "$INSTALL_ENV" == "osx" ]; then
    [ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile.bak
    ln -s ~/dotfiles/bash/.bash_profile.osx ~/.bash_profile

    source ~/.bash_profile
fi

#if [ ! -f ~/.git-completion.bash ]; then
#    echo -n "Install git completion? [Y/n] "; read answer
#    if [[ $answer != "n" ]] && [[ $answer != "N" ]]; then
#        download_to_file https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/.git-completion.bash && source ~/.git-completion.bash
#    fi
#fi
