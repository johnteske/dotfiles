" fuzzy finder
if executable('fzf')
  set rtp+=/usr/local/opt/fzf
  nnoremap <leader>f :FZF!<CR>
else
  nnoremap <leader>f :echoerr 'fzf is not installed'<CR>
endif

" grep
nnoremap <leader>g :grep -R .<left><left><space>
