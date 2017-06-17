
" For alfredodeza/pytest.vim
augroup PyTEst
  autocmd!
  autocmd FileType python call PyTestMappings()
augroup END

function! PyTestMappings()
  nnoremap <buffer> <leader>tm :Pytest method<CR>
  nnoremap <buffer> <leader>tc :Pytest class<CR>
  nnoremap <buffer> <leader>tf :Pytest file<CR>
  nnoremap <buffer> <leader>tp :Pytest project<CR>
endfunction

