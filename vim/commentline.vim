function MapCommentLine(ft, chars)
  execute 'autocmd FileType ' . a:ft . ' nnoremap <buffer> <localleader>/ I' . a:chars . '<space><esc>'
endfunction

call MapCommentLine('javascript', '//')
call MapCommentLine('vim', '"')
