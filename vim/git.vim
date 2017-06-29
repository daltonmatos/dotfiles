" vim: foldmethod=marker foldlevel=2

" Git mappings {{{2 "
" For fugitive.vim
nnoremap <leader>gs   :Gstatus <cr>
nnoremap <leader>gc   :Gcommit <cr>
nnoremap <leader>gd   :Gvdiff <cr>
nnoremap <leader>gp   :Git push <cr>
nnoremap <leader>gbl   :Gblame <cr>
" git history for the current file
nnoremap <leader>glh  :Gitv! <cr>
" git history for the current branch
nnoremap <leader>gh   :Gitv <cr>
nnoremap <leader>gpr  :Git pull --rebase <cr>

" When viewing git commits, star with hunks opened
autocmd FileType git setlocal foldlevel=10

" For Merginal
nnoremap <leader>gb :MerginalToggle<cr>
" }}} Git mappings "

" Git configs {{{3 "
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
  try
    let l:hash = fugitive#repo().rev_parse(a:name)[:8]
    return substitute(a:name, 'feature', 'F', '') .  ' [' . l:hash . ']'
  catch "fugitive throws exception if repo has zero commits
    return '[empty]'
  endtry
endfunction
" }}} Git configs "
