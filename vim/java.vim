
function! DebugJavaFile()
  let l:ch = &cmdheight
  set cmdheight=3
  let l:debugged_class = vebugger#util#getClassFromFilename(expand('%'))

  call RunMvnCompile()
  echo 'Launching debugger for class ' . l:debugged_class
  let &cmdheight = l:ch
  return vebugger#jdb#start(l:debugged_class, {'srcpath': 'src/main/java'})
endfunction

function! InjectExtraClassPath()
  let g:vebugger_extra_classpath = g:JavaComplete_LibsPath
endfunction

function! SetJavaMappings()
  nnoremap <silent> <buffer> <leader>dr :call DebugJavaFile()<CR>
endfunction

let s:debug_mappings = [
  \ {'key': 'n', 'func': ':VBGstepOver'},
  \ {'key': 's', 'func': ':VBGstepIn'},
  \ {'key': 'c', 'func': ':VBGcontinue'},
  \ {'key': 'S', 'func': ':VBGstepOut'},
  \ {'key': 'b', 'func': ':VBGtoggleBreakpointThisLine'},
  \ {'key': 'B', 'func': ':VBGclearBreakpoints'},
  \ {'key': 'k', 'func': ':call KillJavaDebugger()'},
  \ ]

function! InjectDebugMappings()
  for map in s:debug_mappings
    exe 'nnoremap <silent> <buffer> ' . map['key'] . ' ' . map['func'] . '<CR>'
  endfor
endfunction

function! RemoveDebugMappings()
  for map in s:debug_mappings
    exe 'nunmap <buffer> ' . map['key']
  endfor
endfunction

function! KillJavaDebugger()
  VBGkill
  call RemoveDebugMappings()
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

function! RunMvnCompile()
  if &filetype == 'java'
    if filereadable('pom.xml')
      echo 'Running mvn compile...'
      call system('mvn compile')
    endif
  endif
endfunction
