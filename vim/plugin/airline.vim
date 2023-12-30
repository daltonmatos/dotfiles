
""" Vim-AirLine
"
"
if !exists('g:g:airline_symbols')
 let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty = '*'

let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#hunks#enabled = 0 " We have signify enabled
let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#sha1_len = 8
let g:airline#extensions#branch#empty_message = ''

let g:airline_left_sep = ""
let g:airline_section_x = airline#section#create([''])
let g:airline_section_y = airline#section#create([''])
let g:airline_section_z = airline#section#create(['C:%c'])
let g:airline_right_sep = ""
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
