let s:base_config = {
  \"adapter": "debugpy",
  \"breakpoints": {
    \"exception": {
      \"raised": "N",
      \"uncaught": "N",
      \"userUnhandled": "Y"
    \}
  \},
  \"configuration": {
    \  "type": "python",
    \  "request": "launch",
    \  "cwd": "",
    \  "python": "",
    \  "stopOnEntry": v:false,
    \  "console": "externalTerminal",
    \  "debugOptions": [],
    \  "program": "",
    \  "args": "",
    \  "justMyCode": v:false
  \}
\}

fun! DebugCurrentTestCase()
  let test_runner_cmd = autodap#base#build_test_runner_cmd()
  let python_cmd = autodap#base#build_python_cmd()
  let test_runner_args = autodap#base#build_test_runner_args()
  call extend(s:base_config['configuration'], {
      \ "cwd": getcwd(),
      \ "python": python_cmd,
      \ "program": test_runner_cmd,
      \ "args": test_runner_args
  \})
  let debug_session_name = fnamemodify(expand('%'), ':t')
  call vimspector#LaunchWithConfigurations({debug_session_name: s:base_config})
endfun


nnoremap <silent> <leader>dt :call DebugCurrentTestCase()<CR>
nnoremap <silent> <leader>dq :call Vimspector_reset()<CR>
nnoremap <silent> <leader>dr :call vimspector#Restart()<CR>
nnoremap <silent> <leader>b :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <leader>bl :call vimspector#ListBreakpoints()<CR>
"

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
let s:vimspector_keys = {
    \ 'C': function('vimspector#Continue'),
    \ 'c': function('vimspector#RunToCursor'),
    \ 'b': function('vimspector#ToggleBreakpoint'),
    \ 'n': function('vimspector#StepOver'),
    \ 's': function('vimspector#StepInto'),
    \ 'r': function('vimspector#StepOut'),
\}
func! s:vimspector_mappings()
  call win_gotoid(g:vimspector_session_windows.code )
"itera em s:vimspector_keys e para cada mappgins, salva o que já existir com
"maparg(key, <mode>, v:false, v:true). Isso retorna um dict com informações do
"mapping já existente.
"Gravamos nosso mapping com mapset.
"Quando formos fazer o restore, iteramos na lista de saved_mappings e
"recolocamos cada um com mapset()
  " nnoremap <leader>dq :call vimspector#Reset()<CR>

  nnoremap <buffer> <silent> b :call vimspector#ToggleBreakpoint()<CR>
  nnoremap <buffer> <silent> n :call vimspector#StepOver()<CR>
  nnoremap <buffer> <silent> s :call vimspector#StepInto()<CR>
  nnoremap <buffer> <silent> C :call vimspector#Continue()<CR>
  nnoremap <buffer> <silent> c :call vimspector#RunToCursor()<CR>
  nnoremap <buffer> <silent> r :call vimspector#StepOut()<CR>
"  call s:vimspector_remove_buttonbars()
endfunction
"
func! Vimspector_reset()
  nunmap <buffer> b
  nunmap <buffer> n
  nunmap <buffer> s
  nunmap <buffer> C
  nunmap <buffer> c
  nunmap <buffer> r
  call vimspector#Reset()
endfunction
"
augroup VimspectorCustom
  autocmd!
  autocmd User VimspectorUICreated call s:vimspector_mappings()
augroup END
