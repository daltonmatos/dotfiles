
function! SetFormatPrg()
  let l:ft_dict = {
        \ "xml": "xmllint\\ --format\\ -",
        \ "json": "json_pp",
        \ }

  if has_key(l:ft_dict, &filetype)
    execute "setlocal formatprg=" . ft_dict[&filetype]
  endif

endfunction

augroup Indent
  autocmd!
  autocmd Filetype * call SetFormatPrg()
augroup END
