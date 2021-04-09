let s:base_config = {
      \    "adapter": "debugpy",
      \    "configuration": {
        \       "name": "<name>: Launch",
        \   "type": "python",
        \  "request": "launch",
        \  "cwd": "",
        \  "python": "/home/daltonmatos/.local/share/virtualenvs/asyncworker-_xqpelax/bin/python",
        \  "stopOnEntry": v:false,
        \ "console": "externalTerminal",
        \  "debugOptions": [],
        \  "program": "/home/daltonmatos/.local/share/virtualenvs/asyncworker-_xqpelax/bin/py.test",
        \  "args": ["tests/test_utils.py::TimeitTests::test_it_marks_finishing_times"]
        \   }
        \}

" test#base#build_position(test#determine_runner(expand('%'), 'nearest|file', {"file": expand('%'), "line": 20}))
" Isso retorna o que é necessário para o <args>.
" Falta buildar o argumento <python> e <program>
" Os dois dependem de saber o venv (pipenv --venv). vim-test acho que pode
" montar essa linha de comando com pipenv...
"
"
fun! DebugCurrentTestCase()
  let _args = test#base#build_position(test#determine_runner(expand('%')), 'nearest', {"file": expand('%'), "line": line('.')})
  " Para que isso funcione, deve haver um .vimspector.json na raiz do projeto
  " com um Configuration de nome Debug Python TestCase
  call vimspector#LaunchWithSettings({"configuration": "Debug Python TestCase", "args": "".join(_args)})
endfun


" .vimspector.json
"{
"  "configurations": {
"    "Debug Python TestCase": {
"      "adapter": "debugpy",
"      "configuration": {
"        "name": "<name>: Launch",
"        "type": "python",
"        "request": "launch",
"        "cwd": "",
"        "python": "/home/daltonmatos/.local/share/virtualenvs/asyncworker-_xqpelax/bin/python",
"        "stopOnEntry": false,
"        "console": "externalTerminal",
"        "debugOptions": [],
"        "program": "/home/daltonmatos/.local/share/virtualenvs/asyncworker-_xqpelax/bin/py.test",
"        "args": ["${args}"]
"      }
"
"    }
"  }
"}
"



nnoremap <leader>dt :call DebugCurrentTestCase()<CR>
nnoremap <leader>b :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>bl :call vimspector#ListBreakpoints()<CR>
"
"let s:vimspector_keys = {
"    \ 'c': function('vimspector#Continue'),
"    \ 'b': function('vimspector#ToggleBreakpoint'),
"    \ 'n': function('vimspector#StepOver'),
"    \ 's': function('vimspector#StepInto'),
"  \}
"
"func! s:vimspector_remove_buttonbars()
"  call win_gotoid(g:vimspector_session_windows.code )
"  nunmenu WinBar
"
"  call win_gotoid(g:vimspector_session_windows.watches )
"  nunmenu WinBar
"endfunction
"
"func! s:vimspector_term_ui()
"
"  call win_gotoid(g:vimspector_session_windows.output)
"  q
"
"  call win_gotoid(g:vimspector_session_windows.stack_trace)
"  wincmd L
"  40wincmd |
"
"  call win_gotoid(g:vimspector_session_windows.terminal)
"  wincmd J
"  10wincmd _
"
"  call win_gotoid(g:vimspector_session_windows.stack_trace)
"  40wincmd |
"
"  call win_gotoid(g:vimspector_session_windows.variables)
"  40wincmd |
"  15wincmd _
"
"  call win_gotoid(g:vimspector_session_windows.watches)
"  15wincmd _
"
"  call win_gotoid(g:vimspector_session_windows.code)
"
"endfunction
"
"func! s:vimspector_mappings()
"  " nnoremap <leader>dq :call vimspector#Reset()<CR>
"  nnoremap <leader>dq :call Vimspector_reset()<CR>
"  nnoremap b :call vimspector#ToggleBreakpoint()<CR>
"  nnoremap n :call vimspector#StepOver()<CR>
"  nnoremap s :call vimspector#StepInto()<CR>
"  nnoremap c :call vimspector#Continue()<CR>
"  call s:vimspector_remove_buttonbars()
"endfunction
"
"func! Vimspector_reset()
"  nunmap b
"  nunmap n
"  nunmap s
"  nunmap c
"  call vimspector#Reset()
"endfunction
"
"augroup VimspectorCustom
"  autocmd!
"  autocmd User VimspectorUICreated call s:vimspector_mappings()
"augroup END
