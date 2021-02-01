" _/ comment current line
function! s:NoRemap(mode, ft, str)
  execute 'autocmd FileType ' . a:ft . ' ' .
    \ a:mode . 'noremap <buffer> <localleader>/ ' .
    \ ':s/^/' . a:str . '/<enter>'
endfunction

function! s:MapCommentLine(fileType, lineComment)
  call map(['n', 'v'], 's:NoRemap(v:val, a:fileType, a:lineComment)')
endfunction

call s:MapCommentLine('javascript', '//')
call s:MapCommentLine('sh', '#')
call s:MapCommentLine('vim', '"')
