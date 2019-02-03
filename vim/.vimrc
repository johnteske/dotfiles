set shortmess=I

set number
set numberwidth=1
hi LineNr ctermfg=8
set cursorline
hi CursorLine cterm=NONE
hi CursorLineNr cterm=bold ctermfg=15

set laststatus=2
hi StatusLine
    \ cterm=NONE
    \ ctermfg=15
    \ ctermbg=8
set statusline=
set statusline+=\%f "filename
set statusline+=\%m "modified
set statusline+=%= "alignment
set statusline+=\%l:%c "line:col

"set backupdir=~/.vim/backup//
"set directory=~/.vim/swp//

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
