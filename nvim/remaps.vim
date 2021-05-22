" leader remaps
let mapleader=" "

" esc is hard to reach
imap jk <Esc>

" file manipulation
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>
nnoremap <leader>` "*

" pane navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>p <C-w>p
nnoremap <leader>= <C-w>=
nnoremap <leader><leader> <C-^>
tmap <leader>\ <C-\><C-n>

" buffer navigation
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

" split panes
nnoremap <Leader>sh :sp<CR>
nnoremap <Leader>sv :vsp<CR>
