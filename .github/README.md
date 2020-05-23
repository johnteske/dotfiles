![shellcheck](https://github.com/johnteske/dotfiles/workflows/shellcheck/badge.svg)

## Installation
```
cd
git clone git@github.com:johnteske/dotfiles.git --bare
alias dotf='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dotf reset . && dotf checkout . # work tree may not be clean
dotf config --local status.showUntrackedFiles no
dotf status
```

## Example usage
```
dotf add .xprofile
dotf commit -m 'Test with xprofile'
```

## Change shell to zsh
```
chsh -l
chsh -s /usr/bin/zsh
```
