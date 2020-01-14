" fuzzy finder
if executable('fzf')
  set rtp+=/usr/local/opt/fzf
  nnoremap <leader>f :FZF!<CR>
else
  nnoremap <leader>f :e .<CR>:echom '''fzf'' is not installed. Using fallback.'<CR>
endif

" grep
nnoremap <leader>g :grep -R .<left><left><space>
