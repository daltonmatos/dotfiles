


function! DebugJavaFile()
  return vebugger#jdb#start(vebugger#util#getClassFromFilename(expand('%')), {'srcpath': 'src/main/java'})
endfunction


function! InjectExtraClassPath()
  let g:vebugger_extra_classpath = g:JavaComplete_LibsPath
endfunction

function! SetJavaMappings()
  nnoremap <silent> <buffer> <leader>dr :call DebugJavaFile()<CR>
endfunction

augroup JavaMappings
  autocmd!
  autocmd FileType java call SetJavaMappings()
  autocmd FileType java setlocal fileencoding=utf-8
augroup END


augroup Vebugger
  autocmd!
  autocmd User Vebugger_PreStartDebugger call InjectExtraClassPath()
augroup END
