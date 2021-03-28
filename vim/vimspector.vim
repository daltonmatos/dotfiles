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
