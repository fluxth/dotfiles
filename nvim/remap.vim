" leader remaps
let mapleader=" "

" file manipulation
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :wq<CR>
nnoremap <C-s> :w<CR>

" pane navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>p <C-w>p
nnoremap <Leader>= <C-w>=
nnoremap <Leader><Leader> <C-^>

" split panes
nnoremap <Leader>sh :sp<CR>
nnoremap <Leader>sv :vsp<CR>

" nerdtree remaps
nnoremap <Leader>f :NERDTreeFocus<CR>
nnoremap <Leader>tt :NERDTreeToggle<CR>
nnoremap <Leader>tp :NERDTreeFind<CR>
" nmap <Leader>tr <20>fr<20>p

" telescope remaps
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

" nvim-lsp remaps
nnoremap <Leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nvim-lsp: Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-fugitive remaps
nnoremap <Leader>gs :G<CR>

" nnoremap <Leader><CR> :ClangFormat<CR>
