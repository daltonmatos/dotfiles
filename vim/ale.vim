
let g:ale_close_preview_on_insert = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}
let g:ale_python_black_options = '--line-length 80'
let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_mypy_options = '--ignore-missing-imports --no-incremental'
let g:ale_python_isort_options = '--apply --recursive --line-width 80 --use-parentheses --no-inline-sort --multi-line 3 --trailing-comma'

let g:ale_completion_enabled = 1
let g:ale_completion_delay = 200
let g:ale_close_preview_on_insert = 1
"
" Não sublinhar as linhas que o linter (pyls) acusar problemas
let g:ale_set_highlights = 0

let g:ale_linters = {
      \ 'python': ['mypy', 'pyls'],
\}

set completeopt=menu,menuone,preview,noselect,noinsert
