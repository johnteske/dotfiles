set laststatus=2
hi StatusLine
  \ cterm=NONE
  \ ctermfg=15
  \ ctermbg=8
hi StatusLineNC
  \ cterm=NONE
  \ ctermfg=15
  \ ctermbg=NONE
set statusline=
set statusline+=\%f " filename
set statusline+=\%m " modified
set statusline+=%= " alignment
set statusline+=\%l:%c " line:col
