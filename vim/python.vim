
autocmd FileType python setlocal completeopt-=preview

let g:virtualenv_auto_activate = 1

augroup VirtualEnv
  autocmd!
  autocmd User RooterChDir call virtualenv#activate('', 1)
augroup END



" for jedi-vim
let g:jedi#use_tabs_not_buffers = 1


" For neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1

