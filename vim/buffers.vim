" fuzzy finder
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

  nnoremap <silent> <leader>b :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'down':    len(<sid>buflist()) + 2
      \ })<CR>
else
  " fallback
  nnoremap <leader>b :ls<CR>:b
endif
