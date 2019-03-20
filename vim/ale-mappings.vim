
" Mappings globais

imap <C-Space> <Plug>(ale_complete)
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-J> <Plug>(ale_next_wrap)

" Code Navigation
" Namespace <leager>c (Code)

nmap <silent> <leader>cd :ALEGoToDefinition <CR>
nmap <silent> <leader>/cd :ALEGoToDefinitionInVSplit <CR>
nmap <silent> <leader>-cd :ALEGoToDefinitionInSplit <CR>

nmap <silent> <leader>cf :ALEFindReferences <CR>
nmap <silent> <leader>ci :ALEHover <CR>
