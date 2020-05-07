## Installation
```
git clone --bare
alias dotf='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dotf config --local status.showUntrackedFiles no
dotf status
dotf add .xprofile
dotf commit -m 'Test with xprofile'
```

## Change shell to zsh
```
chsh -l
chsh -s /usr/bin/zsh
```
