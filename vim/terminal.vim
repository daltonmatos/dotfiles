
hi Terminal guibg=black ctermbg=black

function! OpenTerminal()
  let l:dir = getcwd()
  let l:opts = {"term_name": "Terminal", "term_finish": "close", "env": {"CHG_PWD": l:dir}}
  call term_start("zsh --login -i", l:opts)
endfunc

nnoremap <silent> <Leader>t :call OpenTerminal()<CR>
tnoremap <Esc> <C-W>N

tnoremap <C-W>p <C-W>"0
tnoremap <C-W><Leader>p <C-W>"+


augroup Terminal_Options
  autocmd!
  autocmd BufWinEnter terminal :ToggleWhitespace
augroup END
