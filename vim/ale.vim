
let g:ale_close_preview_on_insert = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}
let g:ale_python_black_options = '--line-length 80'
let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'

let g:ale_completion_enabled = 1
let g:ale_completion_delay = 30
"
" Não sublinhar as linhas que o linter (pyls) acusar problemas
let g:ale_set_highlights = 0

let g:ale_linters = {
      \ 'python': ['mypy', 'pyls'],
\}

set completeopt=menu,menuone,preview,noselect,noinsert
