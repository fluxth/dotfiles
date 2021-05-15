" leader remaps
let mapleader=" "

" esc is hard to reach
imap jk <Esc>

" file manipulation
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :wq<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>D :bd!<CR>
nnoremap <C-s> :w<CR>
nnoremap <Leader>` "*

"pane navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>p <C-w>p
nnoremap <Leader>= <C-w>=
nnoremap <Leader><Leader> <C-^>
tmap <Leader>\ <C-\><C-n>

" buffer navigation
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

" tab navigation
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprev<CR>

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
nnoremap <Leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>pg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pv :Telescope treesitter<CR>

" nvim-lsp remaps
nnoremap <Leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nvim-lsp: Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-fugitive remaps
nnoremap <Leader>gg :G<CR>
nnoremap <Leader>gd :Gvdiffsplit<CR>

" html autoclose remap
"iabbrev </ </<C-x><C-o>

" nnoremap <Leader><CR> :ClangFormat<CR>
