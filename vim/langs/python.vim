
function! s:pylsp_server_cmd(server_info)
  if has_key(environ(),'VIRTUAL_ENV')
    let l:pylsp_bin = environ()['VIRTUAL_ENV'] . '/bin/pylsp'
    if filereadable(l:pylsp_bin)
      return [environ()['VIRTUAL_ENV'] . '/bin/pylsp']
    endif
  endif
  return ['pylsp']

endfunction


au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': function('s:pylsp_server_cmd'),
        \ 'allowlist': ['python'],
        \ })

autocmd FileType python setlocal completeopt-=preview

augroup VirtualEnv
  autocmd!
  autocmd User RooterChDir call virtualenv#activate('', 1)
augroup END


function! python#empty_ft()
  if &filetype =~# "python"
    return ''
  else
    return airline#parts#filetype()
  endif
endfunction


" Torna complete muito lento
" augroup lsp_folding
" 	autocmd!
" 	autocmd FileType python setlocal
" 	    \ foldmethod=expr
" 	    \ foldexpr=lsp#ui#vim#folding#foldexpr()
" 	    \ foldtext=lsp#ui#vim#folding#foldtext()
" augroup end
