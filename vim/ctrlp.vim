
""" CTRLP
"
let g:ctrlp_cmd = "CtrlP"
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_regexp = 1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_max_depth = 10

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](dist|node_modules)$',
  \ }
nnoremap <C-D> :CtrlP ~/
