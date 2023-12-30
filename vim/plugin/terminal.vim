
hi Terminal guibg=black ctermbg=black

function! OpenTerminal()
  for buf_nr in tabpagebuflist()
    if bufname(buf_nr) == "Terminal"
      exec bufwinnr(buf_nr) . 'wincmd w'
      return
    endif
  endfor

  let l:dir = getcwd()
  let l:opts = {"term_name": "Terminal", "term_finish": "close", "env":
        \{
          \"CHG_PWD": l:dir,
          \"VIM_CURRENT_SERVERNAME": v:servername
        \}
        \}
  let l:bufnr = term_start("zsh --login -i", l:opts)
  let l:winid = bufwinid(l:bufnr)

  exec l:winid . 'wincmd J'
  exec l:winid . 'resize 10'
endfunc

nnoremap <silent> <Leader>t :call OpenTerminal()<CR>

" ESC, no terminal volta para a janela onde eu estava anteriormente
tnoremap <Esc> <C-W>p

tnoremap <C-W>p <C-W>"0
tnoremap <C-W><Leader>p <C-W>"+


augroup Terminal_Options
  autocmd!
  autocmd BufWinEnter terminal :ToggleWhitespace
augroup END
