" leader remaps
let mapleader=" "

" esc is hard to reach
imap jk <Esc>

" file manipulation
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>

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
nnoremap <C-k> :bp<CR>
nnoremap <C-j> :bn<CR>

" close buffer
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>

" tab navigation
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

" split panes
nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vsp<CR>
nnoremap <leader>sd <C-w><C-o>

" new tab
nnoremap <leader>t :tabnew<CR>

" diff remaps
nnoremap <leader>sp :diffput<CR>
vnoremap <leader>sp :diffput<CR>
nnoremap <leader>sg :diffget<CR>
vnoremap <leader>sg :diffget<CR>

" too much thinking for ^ and $
nnoremap <leader>[ ^
nnoremap <leader>] $

" the system clipboard (tm)
nnoremap <leader>` "*

" qflist remaps
nnoremap <leader>lg :call ToggleQFList(1)<CR>
nnoremap <leader>lf :call ToggleQFList(0)<CR>

nnoremap <C-Left> :lprev<CR>zz
nnoremap <C-Right> :lnext<CR>zz
nnoremap <C-Up> :cprev<CR>zz
nnoremap <C-Down> :cnext<CR>zz

let g:fluxth_qf_l = 0
let g:fluxth_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:fluxth_qf_g == 1
            let g:fluxth_qf_g = 0
            cclose
        else
            let g:fluxth_qf_g = 1
            copen
        end
    else
        if g:fluxth_qf_l == 1
            let g:fluxth_qf_l = 0
            lclose
        else
            let g:fluxth_qf_l = 1
            lopen
        end
    endif
endfun
