
augroup Fugitive_Options
  autocmd!
  autocmd BufWinEnter */.git/COMMIT_EDITMSG wincmd _
  autocmd BufWinEnter fugitive://* :ToggleWhitespace
augroup END

let g:Gitv_OpenHorizontal = 1

augroup Merginal_Options
  autocmd!
  autocmd User Merginal_BranchList setlocal number
  autocmd User Merginal_BranchList setlocal relativenumber
  autocmd User Merginal_HistoryLog nmap <buffer> j <C-N> | nmap k <C-P>
augroup END

let g:airline#extensions#branch#format = 'CustomBranchName'
function! CustomBranchName(name)
  let l:hash = fugitive#repo().rev_parse(fugitive#repo().head())[:8]
  return substitute(a:name, 'feature', 'F', '') .  ' [' . l:hash . ']'
endfunction
