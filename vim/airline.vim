
""" Vim-AirLine
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_splits = 0 " Remove o nome do buffer no canto direito da tabline
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#hunks#enabled = 0 " We have signify enabled
let g:virtualenv_stl_format = 'ጸ (%{get(g:, "virtualenv_name")})'
let g:airline#extensions#tagbar#enabled = 0
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline_section_c = airline#section#create(['Project: %{getcwd()}'])
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ 't' : 'T',
      \ }
let g:airline_right_alt_sep = ''

let g:airline_section_x = '%{airline#util#prepend("",0)}%{airline#util#wrap(python#empty_ft(),0)}'
