
" Mapping for search using :Ack
nnoremap <leader>a :Ack <cword><CR>
inoremap <C-F> <ESC>:Ack <cword><CR>

" When on VISUAL mode:
" yank current selected text to default register (y)
" Selects Ack for search (:Ack)
" Types default register's content back (<C-R>")
" hits enter <CR>
vnoremap <leader>a y:Ack <C-R>"<CR>

nnoremap <leader>la :Ack <cword> %<CR>
vnoremap <leader>la y:Ack <C-R>" %<CR>
