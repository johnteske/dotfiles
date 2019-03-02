augroup GitCommit
  autocmd!
  " Add colorcolumn guides for better commit messages
  autocmd FileType gitcommit
    \ set textwidth=72 |
    \ set colorcolumn+=73 |
    \ set colorcolumn+=51
augroup END
