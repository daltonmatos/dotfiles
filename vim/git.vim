
augroup Fugitive_Options
  autocmd!
  autocmd BufWinEnter */.git/COMMIT_EDITMSG wincmd _
  autocmd BufWinEnter fugitive://* :ToggleWhitespace
augroup END

let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 1
