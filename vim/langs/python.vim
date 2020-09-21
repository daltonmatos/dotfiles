au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })

autocmd FileType python setlocal completeopt-=preview

let g:virtualenv_auto_activate = 1

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
