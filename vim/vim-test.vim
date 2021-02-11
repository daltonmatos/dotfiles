
nnoremap <leader>tm :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tp :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>

let test#java#maventest#options = '-B --quiet'
let test#strategy = "vimterminal"
