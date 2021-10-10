" vim: foldmethod=marker foldlevel=2

" Git mappings {{{2 "
" For fugitive.vim
nnoremap <leader>gs   :Git <cr>
nnoremap <leader>gd   :Gvdiff <cr>
nnoremap <leader>gp   :Git push <cr>
nnoremap <leader>gP   :Git push -f
nnoremap <leader>dp   :diffput <cr>
nnoremap <leader>dg   :diffget <cr>

vnoremap <leader>dg   :diffget <cr>
vnoremap <leader>dp   :diffput <cr>

" git history for the current file
nnoremap <leader>glh  :Gitv! <cr>
" git history for the current branch
nnoremap <leader>gh   :Gitv <cr>
nnoremap <leader>gpr  :Git pull --rebase <cr>

" When viewing git commits, star with hunks opened
autocmd FileType git setlocal foldlevel=10

" For Merginal
nnoremap <leader>gb :MerginalToggle<cr>
let g:merginal_splitType=''
let g:merginal_windowSize=15

" }}} Git mappings "

" Git configs {{{3 "
augroup Fugitive_Options
  autocmd!
  autocmd BufWinEnter */.git/COMMIT_EDITMSG wincmd _
augroup END

let g:Gitv_OpenHorizontal = 1

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
