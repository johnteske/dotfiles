au InsertEnter * hi User1 ctermfg=8 ctermbg=3
au InsertLeave * hi User1 ctermfg=7 ctermbg=8

set laststatus=2

set statusline=
set statusline+=%1* " User1 highlight
set statusline+=\%f " filename
set statusline+=%2* " User2 highlight
set statusline+=\ %m " modified
set statusline+=%= " alignment
set statusline+=%3* " User3 highlight
set statusline+=\%l:%c " line:col
