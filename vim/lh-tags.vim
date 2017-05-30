
augroup LHTags_Options
  autocmd!
  autocmd Filetype * let b:tags_dirname = getcwd()
augroup END

if !has_key(g:, 'tags_options')
  let g:tags_options = {}
endif

" Auto update tags file on save
let g:tags_options.no_auto = 0
let g:tags_options.auto_spellfile_update = 0

nmap <Leader>lt <Plug>CTagsSplitOpen
