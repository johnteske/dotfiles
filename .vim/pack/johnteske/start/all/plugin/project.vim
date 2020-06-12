" _ff find file
if executable('fzf')
  " fzf
  set rtp+=/usr/local/opt/fzf
  nnoremap <leader>ff :call fzf#run({'options': '--preview "head -80 {}"', 'sink': 'e'})<CR>
else
  " fallback
  nnoremap <leader>ff :e .<CR>:echom '''fzf'' is not installed. Using fallback.'<CR>
endif

" _g grep
nnoremap <leader>g :grep -R .<left><left><space>
