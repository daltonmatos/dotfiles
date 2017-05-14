
function! DebugJavaFile()
  return vebugger#jdb#start(vebugger#util#getClassFromFilename(expand('%')), {'srcpath': 'src/main/java'})
endfunction

function! InjectExtraClassPath()
  let g:vebugger_extra_classpath = g:JavaComplete_LibsPath
endfunction

function! SetJavaMappings()
  nnoremap <silent> <buffer> <leader>dr :call DebugJavaFile()<CR>
endfunction

function! InjectDebugMappings()
  nnoremap <silent> <buffer> n :VBGstepOver<CR>
  nnoremap <silent> <buffer> s :VBGstepIn<CR>
  nnoremap <silent> <buffer> c :VBGcontinue<CR>
  nnoremap <silent> <buffer> S :VBGstepOut<CR>
  nnoremap <silent> <buffer> k :call KillJavaDebugger()<CR>
  "  nnoremap <silent> <buffer>
endfunction

function! KillJavaDebugger()
  VBGkill
  call RemoveDebugMappings()
endfunction

function! RemoveDebugMappings()
  nunmap <buffer> n
  nunmap <buffer> s
  nunmap <buffer> c
  nunmap <buffer> S
  nunmap <buffer> k
  "  nnoremap <silent> <buffer>
endfunction

augroup JavaMappings
  autocmd!
  autocmd FileType java call SetJavaMappings()
  autocmd FileType java setlocal fileencoding=utf-8
augroup END

augroup Vebugger
  autocmd!
  autocmd User Vebugger_PreStartDebugger call InjectExtraClassPath()
  autocmd User Vebugger_DebuggerActive call InjectDebugMappings()
augroup END
