" _fb find buffer
if executable('fzf')
  function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
  endfunction

  function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
  endfunction

  nnoremap <silent> <leader>fb :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'down':    len(<sid>buflist()) + 2
      \ })<CR>
endif

" _b buffer
nnoremap <leader>b :ls<CR>:b
