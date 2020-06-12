let mapleader=" "
let maplocalleader=mapleader

set nocompatible

filetype plugin on
syntax on
colorscheme johnteske

set path+=**
set shortmess=Iat
set showcmd
set softtabstop=2
  \ shiftwidth=2
  \ expandtab
set ignorecase
set smartcase
set hidden " allow buffers to be unsaved when switching
set t_Co=16 " set palette to 16 colors

" substitute current word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

set hlsearch
nnoremap <leader><esc> :silent! nohls<cr>

inoremap kj <esc>

" change popup up/down bindings to C-j and C-k
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
