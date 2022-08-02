" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-j> and <c-k> to traverse list
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

" Use <c-\> to trigger completion.
inoremap <silent><expr> <c-\> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" GoTo code navigation.
nmap <leader>vd <Plug>(coc-definition)
nmap <leader>vt <Plug>(coc-type-definition)
nmap <leader>vi <Plug>(coc-implementation)
nmap <leader>vr <Plug>(coc-references)

" Diagnostics
nnoremap <leader>ve :CocDiagnostics<CR>
nmap <leader>v[ <Plug>(coc-diagnostic-prev)
nmap <leader>v] <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc explorer
nnoremap <silent> <leader>e :CocCommand explorer<CR>

" coc snippet
imap <C-l> <Plug>(coc-snippets-expand)

vmap <leader>av <Plug>(coc-format-selected)
nmap <leader>av <Plug>(coc-format-selected)

let g:coc_filetype_map = {
  \ 'htmldjango': 'html',
  \ }

nnoremap <leader>sc :call CocAction('diagnosticToggle')<cr>
